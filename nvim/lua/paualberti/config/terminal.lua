vim.api.nvim_create_autocmd("TermOpen", { -- Disable line numbers
	callback = function()
		vim.o.number = false -- Disable absolute line numbers
		vim.o.relativenumber = false -- Disable relative line numbers
	end,
})

vim.api.nvim_create_autocmd("TermClose", { -- Restore line numbers
	callback = function()
		vim.o.number = true -- Enable absolute line numbers
		vim.o.relativenumber = true -- Enable relative line numbers
	end,
})

-- Function to locate an existing terminal buffer
local function locate_terminal()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].buftype == "terminal" then
			return buf -- Return terminal buffer number
		end
	end
	return nil
end

local function close_open_terminals()
	local term_bufnr = locate_terminal()
	if term_bufnr then
		-- Close the existing terminals
		vim.api.nvim_buf_delete(term_bufnr, { force = true }) -- Force close
		close_open_terminals() -- Recursively call
		return
	end
	print("All terminals are closed")
end

-- Create a user command to close open terminals
local term_close = "TermClose"
vim.api.nvim_create_user_command(term_close, close_open_terminals, {})

-- Function to open a terminal or restart it
local function open_terminal()
	close_open_terminals()
	print("Opening a split terminal")

	-- No terminal found, create a new one
	local height = 7
	vim.cmd.vnew() -- Open a new vertical split
	vim.cmd.wincmd("J") -- Move it to the bottom
	vim.cmd.term() -- Start terminal
	vim.cmd.resize(height) -- Resize terminal to 'height' lines
	vim.cmd.wincmd("k")
end

-- Create a user command to open a terminal
local term_open = "TermOpen"
vim.api.nvim_create_user_command(term_open, open_terminal, {})

-- Function to send a command to the terminal
local function send_to_terminal(cmd)
	local term_bufnr = locate_terminal() -- Find the terminal buffer
	if term_bufnr then
		local terminal_id = vim.api.nvim_buf_get_var(term_bufnr, "terminal_job_id") -- Get terminal job ID
		if terminal_id then
			-- Send each argument followed by a space
			for _, arg in ipairs(cmd) do
				vim.api.nvim_chan_send(terminal_id, arg .. " ")
			end
			vim.api.nvim_chan_send(terminal_id, "\n") -- Send newline to execute command

			-- Auto-scroll to bottom after sending command
			vim.api.nvim_buf_call(term_bufnr, function()
				vim.cmd("normal! G")
			end)
		else
			print("Error: Unable to find terminal job ID.") -- Handle missing job ID
		end
	else
		print("Unable to find active terminal") -- Handle missing terminal
	end
end

-- Create a user command to send commands to the terminal
local term_command = "TermCommand"
vim.api.nvim_create_user_command(term_command, function(opts)
	local args = vim.split(opts.args, " ") -- Split command arguments into a table
	send_to_terminal(args) -- Send command to the terminal
end, { nargs = "+" }) -- Require at least one argument

-- Keybinding related to the terminal
vim.keymap.set("n", Leader .. "to", "<Cmd>" .. term_open .. "<CR>", { desc = "Open Terminal" })
vim.keymap.set("n", Leader .. "tc", "<Cmd>" .. term_close .. "<CR>", { desc = "Close" }) -- Close open terminals
vim.keymap.set("n", Leader .. "ts", ":" .. term_command .. " ", { desc = "Send Command" }) -- Send Command
