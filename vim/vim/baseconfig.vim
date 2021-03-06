" _____
"| ____|__ _  __| | ___   _____   _(_)_ __ ___  _ __ ___
"|  _| / _` |/ _` |/ _ \ / __\ \ / / | '_ ` _ \| '__/ __|
"| |__| (_| | (_| | (_) | (__ \ V /| | | | | | | | | (__
"|_____\__, |\__,_|\___/ \___| \_/ |_|_| |_| |_|_|  \___|
"       |___/


" Maintainer:
"     Egidio Docile
"
" Sections:
"     -> General
"     -> Backup
"     -> Indentation
"     -> Search
"     -> Interface
"     -> Misc
"     -> Custom commands


"[General]
filetype plugin on
filetype indent on
syntax on
set fileformat=unix

"[Backup]
set noswapfile

"[Indentation]
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround

"[Search]
set hlsearch
set ignorecase
set smartcase
set incsearch

"[Interface]
colorscheme default
set background=light
set title
set number
set ruler
set textwidth=79
set showmatch
set signcolumn=no
set list
set listchars=trail:·,tab:▸\ ,eol:$
set mouse=a
set pastetoggle=<F2>
set splitbelow
set splitright

"[Misc]
set autoread
set clipboard=unnamedplus
set modifiable
set path+=**
set wildmenu
set wildmode=longest:full,full


"[Custom commands]
command! Mktags !ctags -R .

augroup autorun
  autocmd BufEnter * silent! lcd %:p:h
  autocmd BufWritePre * %s/\s\+$//e
augroup end


"[Custom mappings]
let g:mapleader = ','

nnoremap <F7> :set cursorcolumn!<CR>
nnoremap <F12> :set spell! spelllang=en_us<CR>

" Re-select when shifting left or right in visual mode
vnoremap < <gv
vnoremap > >gv

" Easier navigation in splits
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Use the force, Luke.
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

