-----------------
-- Set keymaps --
-----------------

vim.keymap.set("n", Leader .. "x", "<Cmd>source<CR>", { desc = "Source file" })

vim.keymap.set("n", Leader .. "bs", ":setlocal spelllang=", { desc = "Spanish" })
vim.keymap.set("n", Leader .. "bf", "1z=", { desc = "Insert first" })
vim.keymap.set("n", Leader .. "bi", "=gg=G", { desc = "Indent" })

-- Some convenient keymaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "J", "mzJ`z")

-- Replace visually selected text
vim.keymap.set("v", Leader .. "rf", '"hy:%s/<C-r>h/', { desc = "in File" })
vim.keymap.set("v", Leader .. "rl", '"hy:s/<C-r>h/', { desc = "in Line" })

-- Scrolling
vim.keymap.set("n", "<ScrollMouseDown", "j", { desc = "Scroll Down" })
vim.keymap.set("n", "<ScrollMouseUp", "k", { desc = "Scroll Up" })

-- stylua: ignore
vim.keymap.set({ "n", "v" }, "Q", function() print("Q is disabled") end)

-- Move by visible lines. Notes:
-- - Don't map in Operator-pending mode because it severely changes behavior:
--   like `dj` on non-wrapped line will not delete it.
-- - Condition on `v:count == 0` to allow easier use of relative line numbers.
vim.keymap.set({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
vim.keymap.set({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })

-- Copy/paste with system clipboard
vim.keymap.set({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "gp", '"+p', { desc = "Paste from system clipboard" })
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
vim.keymap.set("x", "gp", '"+P', { desc = "Paste from system clipboard" })

-- Search inside visually highlighted text. Use `silent = false` for it to
-- make effect immediately.
vim.keymap.set("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

-- Search visually selected text (slightly better than builtins in
-- Neovim>=0.8 but slightly worse than builtins in Neovim>=0.10)
-- TODO: Remove this after compatibility with Neovim=0.9 is dropped
if vim.fn.has("nvim-0.10") == 0 then
	vim.keymap.set("x", "*", [[y/\V<C-R>=escape(@", '/\')<CR><CR>]], { desc = "Search forward" })
	vim.keymap.set("x", "#", [[y?\V<C-R>=escape(@", '?\')<CR><CR>]], { desc = "Search backward" })
end

-- Save and go to normal mode
vim.keymap.set(
	{ "n", "i", "x" },
	"<C-S>",
	"<Esc><Cmd>silent! update | redraw<CR>",
	{ desc = "Save and go to Normal mode" }
)
