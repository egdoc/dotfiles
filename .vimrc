"  ____             _             _
" |  _ \  ___   ___( )___  __   _(_)_ __ ___  _ __ ___
" | | | |/ _ \ / __|// __| \ \ / / | '_ ` _ \| '__/ __|
" | |_| | (_) | (__  \__ \  \ V /| | | | | | | | | (__
" |____/ \___/ \___| |___/   \_/ |_|_| |_| |_|_|  \___|
"


" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent !curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pearofducks/ansible-vim'
call plug#end()


"------------------------------------------------------------------------------
" Plugin variables
"------------------------------------------------------------------------------
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


"------------------------------------------------------------------------------
" Editor Settings
"------------------------------------------------------------------------------
filetype indent on
filetype plugin on
syntax on
set autoread
set path+=**
set wildmenu
set wildmode=longest:full,full
set noswapfile
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2
set hlsearch
set ignorecase
set incsearch
set smartcase
set clipboard=unnamedplus
set list
set listchars=trail:·,tab:▸\
set mouse=a
set number
set nowrap
set pastetoggle=<F2>
set ruler
set showmatch
set splitbelow
set splitright
set title
set background=dark
set termguicolors
silent! colorscheme palenight

"------------------------------------------------------------------------------
" Custom keybindings
"------------------------------------------------------------------------------
let g:mapleader = ','
nnoremap <C-a> :noh<CR>
nnoremap <F6> gq}
nnoremap <F7> :set cursorcolumn!<CR>
nnoremap <F9> :NERDTreeToggle<CR>

" Keep selection when moving text
vnoremap < <gv
vnoremap > >gv

" Easier splits navigation
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
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

"------------------------------------------------------------------------------
" Autorun commands
"------------------------------------------------------------------------------
" Cd to the parent directory of the opened file
autocmd BufEnter * silent! lcd %:p:h

" Remove trailing spaces before saving
autocmd BufWritePre * %s/\s\+$//e

"Share an existing NERDTree, from another tab, in the current tab.
autocmd BufWinEnter * silent! NERDTreeMirror
