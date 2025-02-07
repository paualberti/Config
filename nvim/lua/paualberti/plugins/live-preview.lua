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
		{ "<leader>ps", "<CMD>LivePreview start<CR>", desc = "Start" },
		{ "<leader>pc", "<CMD>LivePreview close<CR>", desc = "Close" },
		{ "<leader>pp", "<CMD>LivePreview pick<CR>", desc = "Pick" },
	},
}
