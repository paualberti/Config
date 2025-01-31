-- Set number and relativenumber in netrw
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

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

local n_v = { "n", "v" }
local n_v_i = { "n", "v", "i" }
local n_v_t = { "n", "v", "t" }

vim.o.guicursor = ""
vim.o.inccommand = "split"
vim.o.completeopt = "menu,menuone,noinsert,popup"
vim.o.mouse = ""
for k, v in pairs(n_v_i) do
    vim.o.mouse = vim.o.mouse .. v
end
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.scrolloff = 5
vim.o.sidescrolloff = 7
vim.o.pumheight = 5
vim.o.hlsearch = false
vim.o.relativenumber = true
vim.o.title = true
vim.o.showmode = true
vim.o.ruler = true

-----------------
-- Set keymaps --
-----------------

vim.keymap.set(n_v_t, "<C-h>", "<CMD>wincmd h<CR>")
vim.keymap.set(n_v_t, "<C-j>", "<CMD>wincmd j<CR>")
vim.keymap.set(n_v_t, "<C-k>", "<CMD>wincmd k<CR>")
vim.keymap.set(n_v_t, "<C-l>", "<CMD>wincmd l<CR>")

vim.keymap.set(n_v_t, "<C-left>", "<CMD>wincmd 10<<CR>")
vim.keymap.set(n_v_t, "<C-right>", "<CMD>wincmd 10><CR>")
vim.keymap.set(n_v_t, "<C-up>", "<CMD>wincmd 5+<CR>")
vim.keymap.set(n_v_t, "<C-down>", "<CMD>wincmd 5-<CR>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set(n_v_i, "<C-c>", "<Esc>")
vim.keymap.set(n_v, "Q", "<Esc>")
vim.keymap.set(n_v, "x", '"_x')
vim.keymap.set("v", "<leader>r", '"hy:%s/<C-r>h/', { desc = "[R]ename" })

vim.keymap.set("n", "<leader>bs", "VggOG", { desc = "[S]elect" })
vim.keymap.set("n", "<leader>bi", "=gg=G", { desc = "[I]ndent" })

vim.keymap.set(n_v, "<leader>y", '"+y', { desc = "[Y]ank to clipboard" })
vim.keymap.set(n_v, "<leader>p", '"+p', { desc = "[P]aste from clipboard" })
