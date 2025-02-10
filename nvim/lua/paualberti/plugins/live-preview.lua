return {
	"brianhuster/live-preview.nvim",
	cmd = "LivePreview",
	dependencies = {
		-- You can choose one of the following pickers
		"nvim-telescope/telescope.nvim",
		-- "ibhagwan/fzf-lua",
		-- "echasnovski/mini.pick",
	},
	opts = {},
	keys = {
		{ Leader .. "ps", "<Cmd>LivePreview start<CR>", desc = "Start" },
		{ Leader .. "pc", "<Cmd>LivePreview close<CR>", desc = "Close" },
		{ Leader .. "pp", "<Cmd>LivePreview pick<CR>", desc = "Pick" },
	},
}
