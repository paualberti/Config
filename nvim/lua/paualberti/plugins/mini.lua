return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup({})
		require("mini.align").setup({})
		require("mini.comment").setup({})
		-- require('mini.completion').setup({})
		require("mini.move").setup({})
		require("mini.operators").setup({})
		require("mini.pairs").setup({})
		-- require('mini.snippets').setup({})
		require("mini.splitjoin").setup({})
		require("mini.surround").setup({})
		require("mini.basics").setup({})
		require("mini.bracketed").setup({})
		require("mini.bufremove").setup({})
		-- require('mini.clue').setup({})
		require("mini.diff").setup({})
		require("mini.extra").setup({})
		-- require('mini.files').setup({})
		-- require("mini.git").setup({})
		-- require('mini.jump').setup({})
		-- require('mini.jump2d').setup({})
		-- require("mini.misc").setup({})
		require("mini.pick").setup({})
		require("mini.sessions").setup({})
		-- require("mini.visits").setup({})
		require("mini.animate").setup({})
		-- require('mini.base16').setup({})
		require("mini.colors").setup({})
		-- require('mini.cursorword').setup({})
		require("mini.hipatterns").setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		})
		-- require('mini.hues').setup({})
		require("mini.icons").setup({})
		require("mini.indentscope").setup({})
		-- require("mini.map").setup({})
		require("mini.notify").setup({})
		-- require('mini.starter').setup({})
		require("mini.statusline").setup({})
		require("mini.tabline").setup({})
		require("mini.trailspace").setup({})
		-- require("mini.doc").setup({})
		require("mini.fuzzy").setup({})
		-- require("mini.test").setup({})
		vim.keymap.set(M.n, "<leader>bd", "<CMD>lua MiniBufremove.delete()<CR>", { desc = "Delete" })

		vim.keymap.set(M.n, "<leader>sw0", MiniSessions.write, { desc = "Last" })
		vim.keymap.set(M.n, "<leader>sr0", MiniSessions.read, { desc = "Last" })
		local sessions = { "1", "2", "3", "4" }
		for _, value in ipairs(sessions) do
			vim.keymap.set(M.n, "<leader>sw" .. value, "<CMD>lua MiniSessions.write('" .. value .. "')<CR>", { desc = value })
			vim.keymap.set(M.n, "<leader>sr" .. value, "<CMD>lua MiniSessions.read('" .. value .. "')<CR>", { desc = value })
		end
	end,
}
