return {
	"hedyhli/outline.nvim",
	cmd = { "Outline", "OutlineOpen" },
	opts = {
		outline_items = {
			show_symbol_details = false,
			show_symbol_lineno = true,
		},
		preview_window = {
			live = true,
		},
	},
	keys = { -- Example mapping to toggle outline
		{ "<leader>to", "<CMD>Outline<CR>", desc = "Outline" },
	},
}
