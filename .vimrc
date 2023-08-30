" ------ Plugin settings ------{{{

" ayu-vim
let g:ayucolor = "mirage"

" palenight
let g:palenight_terminal_italics=1

" nerdtree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1

" vim-airline
let g:airline_powerline_fonts = 1

" ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"}}}


"------ Generic settings ------{{{

" Enable loading plugins for specific filetype
filetype plugin on

" Use system clipboard when possible
if has('clipboard')
  set clipboard=unnamedplus
endif

" Reload file when modified outside of vim
set autoread

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

"}}}


"------ Indentation ------{{{

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


"------ Text search and highlight ------{{{

" Hilight search
set hlsearch

" Ignore case when searching
set ignorecase

" Search in case-sensitive mode if search contains uppercase characters
set smartcase

" Show matches while typing
set incsearch

"}}}


"------ User interface ------{{{

" Set colorscheme
colorscheme palenight

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

"}}}


"------ Automatic commands ------{{{

autocmd BufWinEnter * silent! NERDTreeMirror

"}}}


"------ Keymappings ------{{{

" F2 switch to paste mode
set pastetoggle=<F2>

" CTRL+a to unhilight everything
nnoremap <C-a> :noh<CR>

" Re-select text after moving it
vnoremap < <gv
vnoremap > >gv

" Shortcuts for splits navigation
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Shortcut to toggle NERDTree
nnoremap <f3> :NERDTreeToggle<cr>

" Toggle fold under cursor using spacebar
nnoremap <Space> za

"}}}
