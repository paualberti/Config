local terminal_id = 0
vim.keymap.set(M.n, Leader .. "ts", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, vim.o.scrolloff)

	terminal_id = vim.bo.channel
end, { desc = "Small" })

vim.keymap.set(M.n, Leader .. "tl", function()
	vim.fh.chansend(terminal_id, { "la\r\n" })
end)
