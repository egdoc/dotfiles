"  ____             _             _
" |  _ \  ___   ___( )___  __   _(_)_ __ ___  _ __ ___
" | | | |/ _ \ / __|// __| \ \ / / | '_ ` _ \| '__/ __|
" | |_| | (_) | (__  \__ \  \ V /| | | | | | | | | (__
" |____/ \___/ \___| |___/   \_/ |_|_| |_| |_|_|  \___|
"



" BEHAVIOR
" --------
" Enable loading plugins for specific filetype
filetype plugin on
" Reload file when modified outside of vim
set autoread
" Make search recursive
set path+=**
" Enable enhanced command line completion
set wildmenu
" Completion mode
set wildmode=longest:full,full
" Don't create swapfile
set noswapfile
" Set paste mode key
set pastetoggle=<F2>
" Briefly move cursor to matching bracket
set showmatch

" INDENTATION
" -----------
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

" SEARCHING
" ---------
" Hilight search
set hlsearch
" Ignore case when searching
set ignorecase
" Show matches while typing
set incsearch
" Search in case-sensitive mode if search contains uppercase characters
set smartcase

" INTERFACE
" ---------
" Enable syntax highlighting
syntax on
" Enable use of the mouse
set mouse=a
" Use system clipboard
set clipboard=unnamedplus
" Show line numbers
set number
" Show line and column number of the cursor position
set ruler
" Don't wrap lines
set nowrap
" Set the title of the window to the value of filename
set title
" Show invisible characters as spaces and tabs
set list
" How to display invisible characters
set listchars=trail:·,tab:▸\
" Background is dark
set background=dark
" Use 24-bit colors in the terminal
set termguicolors
" Set colorscheme
colorscheme palenight
" Split window below current one in horizontal mode
set splitbelow
" Split window at right of current one in vertical mode
set splitright


" COMMANDS AUTORUN
" ----------------
" Cd to the parent directory of the opened file
autocmd BufEnter * silent! lcd %:p:h
" Remove trailing spaces before saving
autocmd BufWritePre * %s/\s\+$//e
" Share an existing NERDTree, from another tab, in the current tab.
autocmd BufWinEnter * silent! NERDTreeMirror


" PLUGIN VARIABLES
" ----------------
" Ayu Colorscheme
let g:ayucolor="mirage"
" Palenight colorscheme
let g:palenight_terminal_italics=1
" Vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
" Gitgutter
let g:gitgutter_max_signs = 500
" NERDTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1


" KEYBINDINGS
" -----------
let g:mapleader = ','
" CTRL+a to unhilight everything
nnoremap <C-a> :noh<CR>
" F3 Show NERDTree
nnoremap <F3> :NERDTreeToggle<CR>
" F7 to enable displaying cursor column
nnoremap <F7> :set cursorcolumn!<CR>
" Keep selection when moving text
vnoremap < <gv
vnoremap > >gv
" h to move to left split
nnoremap <C-H> <C-W>h
" j to move to bottom split
nnoremap <C-J> <C-W>j
" k to move to top split
nnoremap <C-K> <C-W>k
" l to move to right split
nnoremap <C-L> <C-W>l
" Disable arrow keys
nnoremap <up> <nop>
inoremap <up> <nop>
vnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <down> <nop>
vnoremap <down> <nop>
nnoremap <left> <nop>
inoremap <left> <nop>
vnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <right> <nop>
vnoremap <right> <nop>

