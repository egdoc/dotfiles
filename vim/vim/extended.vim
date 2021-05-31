" Maintainer:
"     Egidio Docile
"
" Sections:
"     -> General
"     -> Interface
"     -> Gitgutter
"     -> NERDTree
"     -> Coc
"
"
source $HOME/.vim/baseconfig.vim

"[General]
set hidden
set updatetime=300

"[Interface]
set signcolumn=yes
set cmdheight=2
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"[Gitgutter]
let gitgutter_max_signs = 500

"[NERDTree]
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1
autocmd BufWinEnter * silent! NERDTreeMirror
nnoremap <F9> :NERDTreeToggle<CR>

"[Coc]
let g:coc_global_extensions=[
  \'coc-json',
  \'coc-python',
  \'coc-jedi',
  \'coc-tsserver'
\]

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" :
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" :
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

