M = {
	n = "n",
	v = "v",
	i = "i",
	t = "t",
	n_v = { "n", "v" },
	n_t = { "n", "t" },
	n_v_i = { "n", "v", "i" },
}

-- Global options
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"
vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('paualberti.config.autocmd')
require('paualberti.config.options')
require('paualberti.config.keymaps')
require('paualberti.config.terminal')
