return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function() -- Harpoon setup
		local harpoon = require("harpoon")
		harpoon:setup({})

		vim.keymap.set("n", Leader .. "ha", function()
			harpoon:list():add()
		end, { desc = "Add Path" })
		vim.keymap.set("n", Leader .. "hm", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Menu" })

		vim.keymap.set("n", Leader .. "hy", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", Leader .. "hr", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", Leader .. "hs", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", Leader .. "ht", function()
			harpoon:list():select(4)
		end)
	end,
}
