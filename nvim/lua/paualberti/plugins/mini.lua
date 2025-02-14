return {
	-- Text editing
	{ "echasnovski/mini.ai", version = "*", opts = {}, event = "BufEnter" },
	{ "echasnovski/mini.align", version = "*", opts = { mappings = { start_with_preview = "" } }, event = "BufEnter" },
	{ "echasnovski/mini.comment", version = "*", opts = {}, event = "BufEnter" },
	-- { "echasnovski/mini.completion", version = "*", opts = {}, event = 'InsertEnter' },
	-- { "echasnovski/mini.move", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini.operators", version = "*", opts = {}, event = 'BufEnter' },
	{ "echasnovski/mini.pairs", version = "*", opts = { mappings = { ["`"] = false } }, event = "InsertEnter" },
	-- { "echasnovski/mini.snippets", version = "*", opts = {}, event = 'InsertEnter' },
	{ "echasnovski/mini.splitjoin", version = "*", opts = {}, event = "BufEnter" },
	{ "echasnovski/mini.surround", version = "*", opts = {}, event = "BufEnter" },

	-- General workflow
	-- { "echasnovski/mini.basics", version = "*", opts = {}, event = "BufEnter" },
	{ "echasnovski/mini.bracketed", version = "*", opts = {}, event = "BufEnter" },
	-- { "echasnovski/mini.bufremove", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini.clue", version = "*", opts = {}, event = 'BufEnter' },
	{ "echasnovski/mini.diff", version = "*", opts = {}, event = "BufEnter" },
	-- { "echasnovski/mini.extra", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini.files", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini-git", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini.jump", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini.jump2d", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini.misc", version = "*", opts = {}, event = 'BufEnter' },
	{ "echasnovski/mini.pick", version = "*", opts = {}, event = "BufEnter" },
	-- { "echasnovski/mini.sessions", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini.visits", version = "*", opts = {}, event = 'BufEnter' },

	-- Appearance
	{
		"echasnovski/mini.animate",
		version = "*",
		opts = { scroll = { enable = false }, resize = { enable = false } },
		event = "BufEnter",
	},
	-- { "echasnovski/mini.base16", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini.colors", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini.cursorword", version = "*", opts = {}, event = 'BufEnter' },
	{
		"echasnovski/mini.hipatterns",
		version = "*",
		config = function()
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
		event = "BufEnter",
	},
	-- { "echasnovski/mini.hues", version = "*", opts = { background = "#002734", foreground = "#c0c8cc" }, event = 'BufEnter' },
	-- { "echasnovski/mini.icons", version = "*", opts = {}, event = 'BufEnter' },
	{ "echasnovski/mini.indentscope", version = "*", opts = {}, lazy = true },
	-- { "echasnovski/mini.map", version = "*", opts = {}, event = 'BufEnter' },
	{ "echasnovski/mini.notify", version = "*", opts = {}, event = "BufEnter" },
	-- { "echasnovski/mini.starter", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini.statusline", version = "*", opts = {}, event = "BufEnter" },
	-- { "echasnovski/mini.tabline", version = "*", opts = {}, event = "BufEnter" },
	{ "echasnovski/mini.trailspace", version = "*", opts = {}, event = "BufEnter" },

	-- Other
	-- { "echasnovski/mini.doc", version = "*", opts = {}, event = 'BufEnter' },
	-- { "echasnovski/mini.test", version = "*", opts = {}, event = 'BufEnter' },
}
