return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 0,
		icons = {
			mappinqs = vim.g.have_nerd_font,
		},
		spec = {
			{ "<leader>b", group = "Buffer" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>c", group = "Code" },
			{ "<leader>p", group = "Preview" },
			{ "<leader>s", group = "Search" },
			{ "<leader>r", group = "Session Read" },
			{ "<leader>w", group = "Session Write" },
			{ "<leader>r", group = "Rename", mode = M.v },
		},
	},
}
