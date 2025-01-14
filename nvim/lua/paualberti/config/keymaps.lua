local map = function(mode, lhs, rhs, opts)
	opts = opts or { silent = true }
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { silent = true, desc = "[Q]uick_Fix" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- Or just use <c-\><c-n> to exit terminal mode
map("t", "<esc>", "<c-\\><c-n>")

-- Useful keymaps
map("n", "j", "gj") -- Visual j
map("n", "k", "gk") -- Visual k
map("n", "Y", "yg$") -- Yank till eol
map("n", "J", "mzJ`z") -- Join lines
map("n", "<c-d>", "<c-d>zz") -- Center view
map("n", "<c-u>", "<c-u>zz") -- Center view
map("n", "n", "nzzzv", { silent = false }) -- Center view
map("n", "N", "Nzzzv", { silent = false }) -- Center viewkey
map("n", "Q", "<nop>") -- Disable Q
map("i", "<c-c>", "<esc>") -- Standardize <esc>
map("n", "<leader><leader>", "<esc>") -- Disable <space>
vim.keymap.set("n", "<leader>tw", function()
	vim.wo.wrap = not vim.wo.wrap
	print("Wrap is " .. (vim.wo.wrap and "ON" or "OFF"))
end, { desc = "[T]oggle [W]rap" })

-- Better pane navigation
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

-- Pane resizing
map("n", "<c-Up>", "<c-w>5+")
map("n", "<c-Down>", "<c-w>5-")
map("n", "<c-Right>", "<c-w>5>")
map("n", "<c-Left>", "<c-w>5<")

map("v", "<", "<gv") -- Indent left
map("v", ">", ">gv") -- Indent right
map("v", "<leader>rn", '"hy:%s/<c-r>h/', { silent = false, desc = "[R]e[n]ame" })

-- Move selected line / block of text in visual mode
map("v", "J", ":m'>+1<cr>gv=gv")
map("v", "K", ":m'<-2<cr>gv=gv")

-- Don't yank deleted text
map({ "n", "v" }, "x", '"_x')
map("x", "<leader>p", '"_xP')
