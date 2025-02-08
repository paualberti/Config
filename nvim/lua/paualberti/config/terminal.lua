-- Autocommand: When a terminal opens, disable line numbers
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.o.number = false -- Disable absolute line numbers
		vim.o.relativenumber = false -- Disable relative line numbers
	end,
})

-- Autocommand: When a terminal closes, restore normal editor settings
vim.api.nvim_create_autocmd("TermClose", {
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
vim.api.nvim_create_user_command("TerminalClose", close_open_terminals, {})

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
	vim.cmd("normal <C-\\><C-n>") -- Enter terminal mode
end

-- Create a user command to open a terminal
vim.api.nvim_create_user_command("TerminalOpen", open_terminal, {})

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
vim.api.nvim_create_user_command("TerminalCommand", function(opts)
	local args = vim.split(opts.args, " ") -- Split command arguments into a table
	send_to_terminal(args) -- Send command to the terminal
end, { nargs = "+" }) -- Require at least one argument

-- Keybinding to open the terminal
vim.keymap.set(M.n, Leader .. "to", "<CMD>TerminalOpen<CR>", { desc = "Open Terminal" })

-- Autocommand: When a terminal opens, set keybindings
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.keymap.set(M.n, Leader .. "t/", "<CMD>TerminalCommand clear<CR>", { desc = "Clear" }) -- Clear terminal output
		vim.keymap.set(M.n, Leader .. "tc", "<CMD>TerminalClose<CR>", { desc = "Close" }) -- Clear terminal output
		vim.keymap.set(M.n, Leader .. "tm", "<CMD>TerminalCommand make<CR>", { desc = "Run 'make'" }) -- Run 'make' command
		vim.keymap.set(M.n, Leader .. "ts", ":TerminalCommand ", { desc = "Send Command" }) -- Send Command command
	end,
})
