" Plugin settings ------{{{

" ALE
let g:ale_virtualtext_cursor = 0
let g:ale_linters_explicit = 1

" ayu-vim
let g:ayucolor = "mirage"

" gruvbox
let gruvbox_italic = 1

" nerdtree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1

" vim-airline
let g:airline_powerline_fonts = 1

"}}}


" Generic settings ------{{{

" Enable loading plugins for specific filetype
filetype plugin on

" Use system clipboard (+clipboard needed)
set clipboard=unnamedplus

" Reload file when modified outside of vim
set autoread

" Encoding
set encoding=utf-8

" Don't wrap lines
set nowrap

" Make search recursive
set path+=**

" Enable enhanced command line completion
set wildmenu

" Completion mode
set wildmode=longest:full,full

" Don't create swapfile
set noswapfile

" Don't create viminfo
set viminfo=""

"}}}


" Indentation ------{{{

" Load indent by filetype
filetype indent on

" Copy indent from current line when starting a new one
set autoindent

" Tab size
set tabstop=2

" Tab size when performing editing operations
set softtabstop=2

" Use spaces instead of tabs
set expandtab

" Indentation size in normal mode when using >>, <<, cindent
set shiftwidth=2

" Round indent to multiple of shiftwidth when using > or < commands
set shiftround

"}}}


" Text search and highlight ------{{{

" Hilight search
set hlsearch

" Ignore case when searching
set ignorecase

" Search in case-sensitive mode if search contains uppercase characters
set smartcase

" Show matches while typing
set incsearch

"}}}


" User interface ------{{{

" Set colorscheme
colorscheme monokai_pro

" Background is dark
set background=dark

" Open folds by default
set foldlevel=99

" Show invisible characters
set list listchars=trail:·,tab:▸\

" Enable use of the mouse
set mouse=a

" Show line numbers
set number

" Show line and column number of the cursor position
set ruler

" Show command in the last line of the screen
set showcmd

" Create horizontal split below
set splitbelow

" Create vertical split right
set splitright

" Use 24-bit colors in the terminal
set termguicolors

" Set the title of the window to the value of filename
set title

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

"}}}


" Keymappings ------{{{

" F2 switch to paste mode
set pastetoggle=<F2>

" CTRL+a to unhilight everything
nnoremap <C-a> :noh<CR>

" Shortcuts for splits navigation
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Toggle fold under cursor using spacebar
nnoremap <Space> za

" Re-select text after moving it
vnoremap < <gv
vnoremap > >gv

" Shortcuts to explicitly copy/paste to/from system clipboard
if has('clipboard')
  vnoremap <leader>y "+y
  vnoremap <leader>p "+p
endif

"}}}


" Autocommands ------{{{

" Automatically switch to file directory
autocmd BufEnter * silent! lcd %:p:h

" Set filetype of yaml files in 'playbooks' directory to yaml.ansible
autocmd BufRead,BufNewFile */playbooks/*.yml,*/playbooks/*.yaml set filetype=yaml.ansible

" Trigger autoread when changing buffers
autocmd FocusGained,BufEnter * checktime

"}}}
