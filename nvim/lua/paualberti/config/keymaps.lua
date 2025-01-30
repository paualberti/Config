local ToggleWrap = function()
    vim.wo.wrap = not vim.wo.wrap
    print("Wrap is " .. (vim.wo.wrap and "ON" or "OFF"))
end

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { silent = true, desc = "[Q]uick_Fix" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- Or just use <c-\><c-n> to exit terminal mode
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

-- Useful keymaps
vim.keymap.set("n", "j", "gj") -- Visual j
vim.keymap.set("n", "k", "gk") -- Visual k
vim.keymap.set("n", "Y", "yg$") -- Yank till eol
vim.keymap.set("n", "J", "mzJ`z") -- Join lines
vim.keymap.set("n", "<c-d>", "<c-d>zz") -- Center view
vim.keymap.set("n", "<c-u>", "<c-u>zz") -- Center view
vim.keymap.set("n", "n", "nzzzv", { silent = false }) -- Center view
vim.keymap.set("n", "N", "Nzzzv", { silent = false }) -- Center viewkey
vim.keymap.set("n", "Q", "<nop>") -- Disable Q
vim.keymap.set("i", "<c-c>", "<esc>") -- Standardize <esc>
vim.keymap.set("n", "<leader><leader>", "<nop>") -- Disable <space>
vim.keymap.set("n", "<leader>tw", ToggleWrap, { desc = "Toggle Wrap" })
vim.keymap.set("n", "<leader>bi", "gg=G", { desc = "[I]ndent" })
vim.keymap.set("n", "<leader>bs", "ggvG", { desc = "[S]elect" })

-- Better pane navigation
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

-- Pane resizing
vim.keymap.set("n", "<c-Up>", "<c-w>5+")
vim.keymap.set("n", "<c-Down>", "<c-w>5-")
vim.keymap.set("n", "<c-Right>", "<c-w>5>")
vim.keymap.set("n", "<c-Left>", "<c-w>5<")

vim.keymap.set("v", "<", "<gv") -- Indent left
vim.keymap.set("v", ">", ">gv") -- Indent right
vim.keymap.set("v", "<leader>rn", '"hy:%s/<c-r>h/', { silent = false, desc = "[R]e[n]ame" })

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m'>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m'<-2<cr>gv=gv")

-- Don't yank deleted text
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set("x", "<leader>p", '"_xP')
