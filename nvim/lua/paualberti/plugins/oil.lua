return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = false,
		keymaps = {
			["q"] = { "actions.close", mode = "n" },
		},
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent dir with Oil" }),
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
