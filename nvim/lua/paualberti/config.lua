-- Global options
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"
vim.g.have_nerd_font = true
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

------------------
-- Set autocmds --
------------------

vim.api.nvim_create_autocmd("BufEnter", { -- Disable auto_comment on new line
    command = [[set formatoptions-=cro]]
})
vim.api.nvim_command("autocmd VimResized * wincmd =") -- Resize splits on terminal resize
vim.api.nvim_create_autocmd({ "BufWritePre" }, { -- Delete trailing whitspaces
    pattern = { "*.*" },
    callback = function()
	local save_cursor = vim.fn.getpos(".")
	pcall(function() vim.cmd([[%s/\s\+$//e]]) end)
	vim.fn.setpos(".", save_cursor)
    end,
})

-----------------
-- Set options --
-----------------

local n_v   = { "n", "v" }
local n_v_i = { "n", "v", "i" }
local n_v_t = { "n", "v", "t" }

vim.o.mouse = ""
for k, v in pairs(n_v_i) do
    vim.o.mouse = vim.o.mouse .. v
end

vim.o.guicursor   = ""
vim.o.inccommand  = "split"
vim.o.completeopt = "menu,menuone,noinsert,popup"
vim.o.mousescroll = "ver:1,hor:7"

vim.o.shiftwidth     = 4
vim.o.softtabstop    = 4
vim.o.scrolloff      = 5
vim.o.sidescrolloff  = 7
vim.o.hlsearch       = false
vim.o.relativenumber = true
vim.o.title          = true
vim.o.showmode       = true
vim.o.ruler          = true
vim.o.confirm        = false
vim.o.spell          = false

vim.o.foldmethod       = 'indent'
vim.o.foldlevel        = 1
vim.o.foldnestmax      = 10
vim.g.markdown_folding = 1

-----------------
-- Set keymaps --
-----------------

vim.keymap.set("n", "<leader>x", "<CMD>source<CR>", { desc = "Source file" })
vim.keymap.set("n", "<CR>", "za")

vim.keymap.set("n", "<leader>bst", "<CMD>setlocal spell!<CR>", { desc = "Toggle" })
vim.keymap.set("n", "<leader>bse", "<CMD>setlocal spelllang=en_us,en_gb<CR>", { desc = "English" })
vim.keymap.set("n", "<leader>bss", "<CMD>setlocal spelllang=es_es<CR>", { desc = "Spanish" })
vim.keymap.set("n", "<leader>bsf", "1z=", { desc = "Insert first" })
vim.keymap.set("n",   "<leader>bi", "=gg=G", { desc = "[I]ndent" })

vim.keymap.set(n_v, "<ScrollWheelUp>",   "k")
vim.keymap.set(n_v, "<ScrollWheelDown>", "j")

vim.keymap.set(n_v_t, "<C-h>", "<CMD>wincmd h<CR>")
vim.keymap.set(n_v_t, "<C-j>", "<CMD>wincmd j<CR>")
vim.keymap.set(n_v_t, "<C-k>", "<CMD>wincmd k<CR>")
vim.keymap.set(n_v_t, "<C-l>", "<CMD>wincmd l<CR>")

vim.keymap.set(n_v_t, "<C-left>",  "<CMD>wincmd 10<<CR>")
vim.keymap.set(n_v_t, "<C-right>", "<CMD>wincmd 10><CR>")
vim.keymap.set(n_v_t, "<C-up>",    "<CMD>wincmd 5+<CR>")
vim.keymap.set(n_v_t, "<C-down>",  "<CMD>wincmd 5-<CR>")

vim.keymap.set("t",   "<Esc>",     "<C-\\><C-n>")
vim.keymap.set("n",   "J",         "mzJ`z")
vim.keymap.set(n_v_i, "<C-c>",     "<Esc>")
vim.keymap.set(n_v,   "Q",         "<Esc>")
vim.keymap.set(n_v,   "x",         '"_x')
vim.keymap.set("v",   "<leader>r", '"hy:%s/<C-r>h/', { desc = "[R]ename" })
