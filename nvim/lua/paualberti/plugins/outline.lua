return {
	"hedyhli/outline.nvim",
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set("n", "<leader>to", "<cmd>Outline<cr>", { desc = "[T]oggle [O]utline" })

		require("outline").setup({
			-- Your setup opts here (leave empty to use defaults)
			keymaps = {
				goto_location = "<s-cr>",
				goto_and_close = "<cr>",
			},
			outline_window = {
				show_numbers = true,
				show_relative_numbers = true,
			},
		})
	end,
}
