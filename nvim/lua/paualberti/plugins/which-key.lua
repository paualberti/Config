return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 0,
		icons = {
			mappinqs = vim.g.have_nerd_font,
		},
		spec = {
			{ mode = { "n", "x" }, "\\", group = "Toggle" },
			{ mode = { "n", "x" }, Leader .. "b", group = "Buffer" },
			{ mode = { "n", "x" }, Leader .. "c", group = "Code" },
			{ mode = { "n", "x" }, Leader .. "f", group = "Find" },
			{ mode = { "n", "x" }, Leader .. "h", group = "Harpoon" },
			{ mode = { "n", "x" }, Leader .. "p", group = "Preview" },
			{ mode = { "n", "x" }, Leader .. "r", group = "Rename" },
			{ mode = { "n", "x" }, Leader .. "s", group = "Search in Cwd" },
			{ mode = { "n", "x" }, Leader .. "t", group = "Terminal" },
			{ mode = { "n", "x" }, Leader .. "w", group = "Yeet" },
		},
	},
}
