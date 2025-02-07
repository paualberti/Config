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
			{ "<leader>c", group = "Code" },
			{ "<leader>f", group = "Find" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>p", group = "Preview" },
			{ "<leader>r", group = "Rename", mode = M.v },
			{ "<leader>s", group = "Session" },
			{ "<leader>sr", group = "Read" },
			{ "<leader>sw", group = "Write" },
		},
	},
}
