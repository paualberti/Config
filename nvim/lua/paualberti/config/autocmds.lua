-- Disable auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Resize neovim split when terminal is resized
vim.api.nvim_command("autocmd VimResized * wincmd =")

-- Delete trailing whitspaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Go to last location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Automatically close the location list when selecting an entry
vim.api.nvim_create_augroup("AutoCloseLoclistOnSelect", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "AutoCloseLoclistOnSelect",
	pattern = "qf", -- qf is the filetype for both quickfix and location list windows
	callback = function()
		-- Map <CR> to select the diagnostic and close the location list
		vim.keymap.set(
			"n", -- Normal mode
			"<CR>", -- Enter key
			"<CR>:lclose<CR>", -- Navigate to the location and close the location list
			{ noremap = true, silent = true }
		)
	end,
})
