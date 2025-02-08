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

vim.api.nvim_create_autocmd("BufReadPost", { -- Go to last location within a buffer
  pattern = "*.*",
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})
