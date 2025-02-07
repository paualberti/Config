-----------------
-- Set keymaps --
-----------------

vim.keymap.set(M.n, "<leader>x", "<CMD>source<CR>", { desc = "Source file" })
vim.keymap.set(M.n_v, "<leader><leader>", "z")

vim.keymap.set(M.n, "<leader>be", "<CMD>setlocal spelllang=en_us,en_gb<CR>", { desc = "English" })
vim.keymap.set(M.n, "<leader>bs", "<CMD>setlocal spelllang=es_es<CR>", { desc = "Spanish" })
vim.keymap.set(M.n, "<leader>bf", "1z=", { desc = "Insert first" })
vim.keymap.set(M.n, "<leader>bi", "=gg=G", { desc = "Indent" })

vim.keymap.set(M.n_v, "<ScrollWheelUp>", "k")
vim.keymap.set(M.n_v, "<ScrollWheelDown>", "j")

vim.keymap.set(M.n_t, "<C-h>", "<CMD>wincmd h<CR>")
vim.keymap.set(M.n_t, "<C-j>", "<CMD>wincmd j<CR>")
vim.keymap.set(M.n_t, "<C-k>", "<CMD>wincmd k<CR>")
vim.keymap.set(M.n_t, "<C-l>", "<CMD>wincmd l<CR>")

vim.keymap.set(M.n_t, "<C-left>", "<CMD>wincmd 10<<CR>")
vim.keymap.set(M.n_t, "<C-right>", "<CMD>wincmd 10><CR>")
vim.keymap.set(M.n_t, "<C-up>", "<CMD>wincmd 5+<CR>")
vim.keymap.set(M.n_t, "<C-down>", "<CMD>wincmd 5-<CR>")

vim.keymap.set(M.t, "<Esc>", "<C-\\><C-n>")
vim.keymap.set(M.n, "J", "mzJ`z")
vim.keymap.set(M.n_v_i, "<C-;>", "<Esc>mzA;<Esc>`z")
vim.keymap.set(M.v, "<leader>rf", '"hy:%s/<C-r>h/', { desc = "in File" })
vim.keymap.set(M.v, "<leader>rl", '"hy:s/<C-r>h/', { desc = "in Line" })
vim.keymap.set(M.n_v, "x", '"_x')
vim.keymap.set(M.n_v_i, "<C-c>", "<Esc>:")
-- stylua: ignore
vim.keymap.set(M.n_v, "Q", function() print("Q is disabled") end)
