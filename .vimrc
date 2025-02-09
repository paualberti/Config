""""""""""""""""
" Autocommands "
""""""""""""""""

" Disable auto comment on new line
autocmd BufEnter * set formatoptions-=cro

" Resize splits when the terminal is resized
autocmd VimResized * wincmd =

" Delete trailing whitespace before saving
autocmd BufWritePre * %s/\s\+$//e

" Go to last location when opening a buffer
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"""""""""""
" Keymaps "
"""""""""""

let mapleader = " " " map leader to Space

" Exit terminal mode with <Esc>
tnoremap <Esc> <C-\><C-n>

" Open netrw
nnoremap - :Ex<CR>

" Useful keymaps
nnoremap Y yg$
nnoremap J mzJ`z
nnoremap Q <nop>

" Window resizing
nnoremap <C-Up> <C-w>5+
nnoremap <C-Down> <C-w>5-
nnoremap <C-Right> <C-w>5>
nnoremap <C-Left> <C-w>5<

" Better navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Rename in visual mode
vnoremap <leader>rf "hy:%s/<C-r>h/
vnoremap <leader>rl "hy:s/<C-r>h/

"""""""""""
" Options "
"""""""""""

" Tabs and indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set breakindent

" Search settings
set incsearch
set ignorecase
set smartcase
set nohlsearch

" Appearance
set notitle
set number
set relativenumber
set scrolloff=7
set sidescrolloff=8
set signcolumn=yes
set showmode
set cmdheight=1
set laststatus=2
set pumheight=5
set guicursor=

" Behavior
set noconfirm
set updatetime=100
set timeoutlen=500
set noerrorbells
set noswapfile
set nobackup
set undofile
set backspace=indent,eol,start
set splitright
set splitbelow
set mouse=a
set modifiable
