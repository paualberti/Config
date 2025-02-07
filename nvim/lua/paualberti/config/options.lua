-----------------
-- Set options --
-----------------

for _, v in pairs(M.n_v_i) do
	vim.o.mouse = vim.o.mouse .. v
end

vim.o.guicursor = ""
vim.o.inccommand = "split"
vim.o.completeopt = "menu,menuone,noinsert,popup"
vim.o.mousescroll = "ver:1,hor:7"

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.scrolloff = 5
vim.o.sidescrolloff = 7
vim.o.pumheight = 10
vim.o.hlsearch = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = true
vim.o.ruler = true
vim.o.confirm = false
vim.o.spell = false

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.o.foldlevel = 99
vim.g.markdown_folding = 1
