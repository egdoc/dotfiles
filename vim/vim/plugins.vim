" Automagically install vim plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Syntax plugins
Plug 'ekalinin/Dockerfile.vim'
Plug 'evidens/vim-twig'

"Linting and autocomplete plugins
Plug 'mattn/emmet-vim'
Plug 'vim-syntastic/syntastic'

if v:version >= 800
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

"Git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Colorschemes
Plug 'cocopon/iceberg.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'

"Misc plugins
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
