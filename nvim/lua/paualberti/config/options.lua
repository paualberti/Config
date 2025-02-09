-----------------
-- Set options --
-----------------

-- General
vim.o.undofile = true -- Enable persistent undo (see also `:h undodir`)

vim.o.backup = false -- Don't store backup while overwriting the file
vim.o.writebackup = false -- Don't store backup while overwriting the file
vim.o.swapfile = false -- Don't store a swapfile

vim.o.mouse = "a" -- Enable mouse for all available modes

vim.cmd("filetype plugin indent on") -- Enable all filetype plugins
for _, v in ipairs({ "n", "v", "i" }) do
	vim.o.mouse = vim.o.mouse .. v
end

-- Appearance
vim.o.breakindent = true -- Indent wrapped lines to match line start
vim.o.cursorline = true -- Highlight current line
vim.o.linebreak = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show line numbers
vim.o.splitbelow = true -- Horizontal splits will be below
vim.o.splitright = true -- Vertical splits will be to the right
vim.o.hlsearch = false -- searches will not be highlighted
vim.o.shiftwidth = 4 -- <TAB> is 4 spaces
vim.o.tabstop = 4 -- Indent is 4 spaces
vim.o.softtabstop = 4 -- Indent is 4 spaces
vim.o.scrolloff = 7 -- Lines till the end of window
vim.o.sidescrolloff = 8 -- Columns till the end of window

vim.o.ruler = true -- Show cursor position in command line
vim.o.showmode = true -- Show mode in command line
vim.o.wrap = false -- Display long lines as just one line

vim.o.signcolumn = "yes" -- Always show sign column (otherwise it will shift text)
vim.o.fillchars = "eob: " -- Don't show `~` outside of buffer

vim.o.guicursor = ""
vim.o.inccommand = "split"

-- Editing
vim.o.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
vim.o.incsearch = true -- Show search results while typing
vim.o.infercase = true -- Infer letter cases for a richer built-in keyword completion
vim.o.smartcase = true -- Don't ignore case when searching if pattern has upper case
vim.o.smartindent = true -- Make indenting smart

vim.o.completeopt = "menuone,noinsert,noselect" -- Customize completions
vim.o.virtualedit = "block" -- Allow going past the end of line in visual block mode
vim.o.formatoptions = "qjl1" -- Don't autoformat comments

-- Neovim version dependent
if vim.fn.has("nvim-0.10") == 0 then
	vim.o.termguicolors = true -- Enable gui colors
end

-- Some opinioneted extra UI options
vim.o.pumheight = 10 -- Make popup menu smaller

-- NOTE: Having `tab` present is needed because `^I` will be shown if
-- omitted (documented in `:h listchars`).
-- Having it equal to a default value should be less intrusive.
-- o.listchars = "tab:> ,extends:…,precedes:…,nbsp:␣" -- Define which helper symbols to show
-- vim.o.list = true -- Show some helper symbols

-- Enable syntax highlighting if it wasn't already (as it is time consuming)
if vim.fn.exists("syntax_on") ~= 1 then
	vim.cmd([[syntax enable]])
end

-- Fold options
vim.o.foldmethod = "expr" -- Folds are determined by an expression
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Expression by which folds are detected
vim.o.foldlevel = 99 -- Never show folds by default
