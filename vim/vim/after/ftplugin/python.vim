setlocal colorcolumn=80
setlocal softtabstop=4
setlocal shiftwidth=4

" Automatically format text with set max width
nnoremap <F6> :set textwidth=72<CR>gqj:set textwidth=79<CR>
nnoremap <S-F6> :set textwidth=79<CR>gqj:set textwidth=79<CR>
