-- Set number and relativenumber in netrw
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

------------------
-- Set autocmds --
------------------

-- Disable auto_comment on new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })
-- Resize splits on terminal resize
vim.api.nvim_command("autocmd VimResized * wincmd =")
-- Delete trailing whitspaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
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

vim.o.guicursor = ""
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.sidescrolloff = 10
vim.o.hlsearch = false
vim.o.relativenumber = true

-----------------
-- Set keymaps --
-----------------

vim.keymap.set("t", "<Esc>", "<c\\>n")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set({ "i", "v" }, "<C-c>", "<Esc>")
vim.keymap.set({ "n", "v" }, "Q", "<Esc>")

vim.keymap.set({ "n", "v", "t" }, "<C-h>", "<CMD>wincmd h<CR>")
vim.keymap.set({ "n", "v", "t" }, "<C-j>", "<CMD>wincmd j<CR>")
vim.keymap.set({ "n", "v", "t" }, "<C-k>", "<CMD>wincmd k<CR>")
vim.keymap.set({ "n", "v", "t" }, "<C-l>", "<CMD>wincmd l<CR>")

vim.keymap.set({ "n", "v", "t" }, "<C-left>", "<CMD>wincmd 10<<CR>")
vim.keymap.set({ "n", "v", "t" }, "<C-right>", "<CMD>wincmd 10><CR>")
vim.keymap.set({ "n", "v", "t" }, "<C-up>", "<CMD>wincmd 5+<CR>")
vim.keymap.set({ "n", "v", "t" }, "<C-down>", "<CMD>wincmd 5-<CR>")
