"  _____          _            _             _
" | ____|__ _  __| | ___   ___( )___  __   _(_)_ __ ___  _ __ ___
" |  _| / _` |/ _` |/ _ \ / __|// __| \ \ / / | '_ ` _ \| '__/ __|
" | |__| (_| | (_| | (_) | (__  \__ \  \ V /| | | | | | | | | (__
" |_____\__, |\__,_|\___/ \___| |___/   \_/ |_|_| |_| |_|_|  \___|
"       |___/
"


" PLUGINS LOADING
" ---------------------------------------------------------
execute pathogen#infect()
execute pathogen#helptags()


" PLUGIN SETTINGS
" ---------------------------------------------------------
"
"  Ayu theme
"
let ayucolor="mirage"

"
" Gitgutter
"
let gitgutter_max_signs = 500

"
" NERDTree
"
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1
autocmd BufWinEnter * silent! NERDTreeMirror
nnoremap <F9> :NERDTreeToggle<CR>


" EDITOR SETTINGS
" ---------------------------------------------------------
"
" Misc
"
filetype indent on
filetype plugin on
set autoread
set fileformat=unix
set modifiable
set path+=**
set wildmenu
set wildmode=longest:full,full

"
" Backup
"
set noswapfile

"
" Indentation and wrapping
"
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2
set textwidth=79

"
" Search
"
set hlsearch
set ignorecase
set incsearch
set smartcase

"
" Interface
"
set clipboard=unnamedplus
set list
set listchars=trail:·,tab:▸\
set mouse=a
set number
set pastetoggle=<F2>
set relativenumber
set ruler
set showmatch
set splitbelow
set splitright
set title
syntax on

if has('termguicolors')
  set termguicolors
  colorscheme ayu
else
  colorscheme default
endif


" CUSTOM COMMANDS
" ---------------------------------------------------------
command! Mktags !ctags -R .


" AUTORUN COMMANDS
" ---------------------------------------------------------
augroup autorun
  autocmd BufEnter * silent! lcd %:p:h
  autocmd BufWritePre * %s/\s\+$//e
augroup end


" CUSTOM MAPPINGS
" ---------------------------------------------------------
let g:mapleader = ','

nnoremap <F7> :set cursorcolumn!<CR>

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

