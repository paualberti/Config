return {
	"NStefan002/screenkey.nvim",
	version = "*", -- or branch = "dev", to use the latest commit
	opts = {
		win_opts = {
			row = 0,
			col = vim.o.columns - 1,
			relative = "editor",
			anchor = "NE",
			width = 20,
			height = 1,
		},
		show_leader = false,
		group_mappings = true,
		vim.keymap.set("n", "<leader>ts", "<CMD>Screenkey toggle<CR>", { desc = "Screenkey" }),
	},
}
