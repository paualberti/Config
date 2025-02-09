Leader = "<space>"

-- Global options
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"
vim.g.have_nerd_font = true
vim.g.mapleader = "<space>"
vim.g.maplocalleader = "<space>"

require('paualberti.config.autocmd')
require('paualberti.config.options')
require('paualberti.config.keymaps')
require('paualberti.config.terminal')
