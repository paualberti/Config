return {
	"hedyhli/outline.nvim",
	cmd = { "Outline", "OutlineOpen" },
	opts = {
		outline_items = {
			show_symbol_details = false,
		},
		preview_window = {
			live = true,
		},
	},
	keys = { -- Example mapping to toggle outline
		{ "\to", "<CMD>Outline<CR>", desc = "Outline" },
	},
}
