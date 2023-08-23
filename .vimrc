"  ____             _             _
" |  _ \  ___   ___( )___  __   _(_)_ __ ___  _ __ ___
" | | | |/ _ \ / __|// __| \ \ / / | '_ ` _ \| '__/ __|
" | |_| | (_) | (__  \__ \  \ V /| | | | | | | | | (__
" |____/ \___/ \___| |___/   \_/ |_|_| |_| |_|_|  \___|
"


"
" PLUGINS INSTALLATION AND CONFIGURATION
"

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin()
Plug 'airblade/vim-gitgutter', { 'branch': 'main' }
let g:gitgutter_max_signs = 500

Plug 'ayu-theme/ayu-vim'
let g:ayucolor = "mirage"

Plug 'drewtempelmeyer/palenight.vim'
let g:palenight_terminal_italics=1

Plug 'preservim/nerdtree'
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1
nnoremap <f3> :nerdtreetoggle<cr>
autocmd BufWinEnter * silent! NERDTreeMirror

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

Plug 'Sirver/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plug 'honza/vim-snippets'
Plug 'pearofducks/ansible-vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
call plug#end()


"
" EDITOR SETTINGS
"

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

" Hilight search
set hlsearch
" Ignore case when searching
set ignorecase
" Search in case-sensitive mode if search contains uppercase characters
set smartcase
" Show matches while typing
set incsearch

" Enable syntax highlighting
syntax on
" Enable use of the mouse
set mouse=a
" Use system clipboard (works only if vim compiled with clipboard option)
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


"
" COMMANDS AUTORUN
"

" Cd to the parent directory of the opened file
autocmd BufEnter * silent! lcd %:p:h
" Remove trailing spaces before saving
autocmd BufWritePre * %s/\s\+$//e


"
" CUSTOM KEYBINDINGS
"

let g:mapleader = ','
" CTRL+a to unhilight everything
nnoremap <C-a> :noh<CR>
" F6 format text with max width
nnoremap <F6> :set textwidth=72<CR>gqj:set textwidth=79<CR>
" F7 display cursor column
nnoremap <F7> :set cursorcolumn!<CR>
" Keep selection when moving text
vnoremap < <gv
vnoremap > >gv
" CTRL+h to move to left split
nnoremap <C-H> <C-W>h
" CTRL+j to move to bottom split
nnoremap <C-J> <C-W>j
" CTRL+k to move to top split
nnoremap <C-K> <C-W>k
" CTRL+l to move to right split
nnoremap <C-L> <C-W>l

