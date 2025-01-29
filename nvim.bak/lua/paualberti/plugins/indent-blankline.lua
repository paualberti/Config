return { -- Add indentation guides even on blank lines
	"lukas-reineke/indent-blankline.nvim",
	version = "*",
	-- lazy = true,
	-- Enable `lukas-reineke/indent-blankline.nvim`
	-- See `:help ibl`
	main = "ibl",
	vim.keymap.set("n", "<leader>ti", '<cmd>lua require("ibl").setup()<cr>', { desc = "[T]oggle [I]ndentation" }),
}
