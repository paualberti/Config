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
			{ "<leader>bs", group = "Spell" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>p", group = "Preview" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Toggle" },
		},
	},
}
