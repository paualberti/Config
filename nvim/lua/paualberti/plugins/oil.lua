return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		keymaps = {
			["q"] = { "actions.close", mode = "n" },
		},
		vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent dir with Oil" }),
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
