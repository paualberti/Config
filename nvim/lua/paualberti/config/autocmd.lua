------------------
-- Set autocmds --
------------------

vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] }) -- Disable auto_comment on new line

vim.api.nvim_command("autocmd VimResized * wincmd =") -- Resize splits on terminal resize
vim.api.nvim_create_autocmd({ "BufWritePre" }, { -- Delete trailing whitspaces
	pattern = { "*.*" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})
