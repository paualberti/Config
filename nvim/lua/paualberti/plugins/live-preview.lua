return {
	"brianhuster/live-preview.nvim",
	lazy = true,
	dependencies = {
		-- You can choose one of the following pickers
		"ibhagwan/fzf-lua",
		-- "echasnovski/mini.pick",
	},
	opts = {},
	keys = {
		{ Leader .. "ps", "<CMD>LivePreview start<CR>", desc = "Start" },
		{ Leader .. "pc", "<CMD>LivePreview close<CR>", desc = "Close" },
		{ Leader .. "pp", "<CMD>LivePreview pick<CR>", desc = "Pick" },
	},
}
