return {
	-- "shaunsingh/nord.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd([[
	--      colorscheme nord
	--      highlight Normal guibg=NONE ctermbg=NONE
	--      highlight NonText guibg=NONE ctermbg=NONE
	--    ]])
	-- end,

	-- Using lazy.nvim

	"deparr/tairiki.nvim",
	lazy = false,
	priority = 1000, -- only necessary if you use tairiki as default theme
	config = function()
		require("tairiki").setup({
			-- optional configuration here
			transparent = true,
			code_style = {
				comments = "none",
			},
		})
		require("tairiki").load() -- only necessary to use as default theme, has same behavior as ':colorscheme tairiki'
	end,
}
