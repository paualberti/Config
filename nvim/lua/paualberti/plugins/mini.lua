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
		-- require("mini.basics").setup({})
		require("mini.bracketed").setup({})
		-- require("mini.bufremove").setup({})
		-- local miniclue = require("mini.clue")
		-- miniclue.setup({
		-- 	triggers = {
		-- 		-- Leader triggers
		-- 		{ mode = "n", keys = Leader .. "" },
		-- 		{ mode = "x", keys = Leader .. "" },
		--
		-- 		-- Built-in completion
		-- 		{ mode = "i", keys = "<C-x>" },
		--
		-- 		-- `g` key
		-- 		{ mode = "n", keys = "g" },
		-- 		{ mode = "x", keys = "g" },
		--
		-- 		-- Marks
		-- 		{ mode = "n", keys = "'" },
		-- 		{ mode = "n", keys = "`" },
		-- 		{ mode = "x", keys = "'" },
		-- 		{ mode = "x", keys = "`" },
		--
		-- 		-- Registers
		-- 		{ mode = "n", keys = '"' },
		-- 		{ mode = "x", keys = '"' },
		-- 		{ mode = "i", keys = "<C-r>" },
		-- 		{ mode = "c", keys = "<C-r>" },
		--
		-- 		-- Window commands
		-- 		{ mode = "n", keys = "<C-w>" },
		--
		-- 		-- Toggle commands
		-- 		-- { mode = "n", keys = "\\" },
		--
		-- 		-- `z` key
		-- 		{ mode = "n", keys = "z" },
		-- 		{ mode = "x", keys = "z" },
		-- 	},
		-- 	clues = {
		-- 		-- Enhance this by adding descriptions for <leader> mapping groups
		-- 		miniclue.gen_clues.builtin_completion(),
		-- 		miniclue.gen_clues.g(),
		-- 		miniclue.gen_clues.marks(),
		-- 		miniclue.gen_clues.registers(),
		-- 		miniclue.gen_clues.windows(),
		-- 		miniclue.gen_clues.z(),
		--
		-- 		{ mode = "n", keys = Leader .. "b", desc = "Buffer" },
		-- 		{ mode = "n", keys = Leader .. "c", desc = "Code" },
		-- 		{ mode = "n", keys = Leader .. "f", desc = "Find" },
		-- 		{ mode = "n", keys = Leader .. "h", desc = "Harpoon" },
		-- 		{ mode = "n", keys = Leader .. "p", desc = "Preview" },
		-- 		{ mode = "n", keys = Leader .. "s", desc = "Session" },
		-- 		{ mode = "n", keys = Leader .. "sr", desc = "Read" },
		-- 		{ mode = "n", keys = Leader .. "sw", desc = "Write" },
		-- 		{ mode = "n", keys = Leader .. "t", desc = "Terminal" },
		-- 		{ mode = "v", keys = Leader .. "r", desc = "Rename" },
		-- 	},
		-- 	window = {
		-- 		-- Floating window config
		-- 		config = {},
		--
		-- 		-- Delay before showing clue window
		-- 		delay = 0,
		--
		-- 		-- Keys to scroll inside the clue window
		-- 		scroll_down = "<C-d>",
		-- 		scroll_up = "<C-u>",
		-- 	},
		-- })
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
		-- require("mini.statusline").setup({})
		require("mini.tabline").setup({})
		require("mini.trailspace").setup({})
		-- require("mini.doc").setup({})
		require("mini.fuzzy").setup({})
		-- require("mini.test").setup({})
	end,
}
