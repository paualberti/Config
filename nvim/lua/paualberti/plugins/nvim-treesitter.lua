return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
	ensure_installed = {
	    'bash',     'c',   'lua', 'luadoc',
	    'markdown', 'markdown_inline',
	    'query',    'vim', 'vimdoc'
	},
	highlight = { enable = true },
	incremental_selection = { enable = false },
	textobjects = { enable = false },
	indent = { enable = true },
    },
}
