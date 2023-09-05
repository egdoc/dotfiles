if exists(':NERDTreeMirror')
  autocmd BufWinEnter * silent! NERDTreeMirror

  " Shortcut to toggle NERDTree
  nnoremap <f3> :NERDTreeToggle<cr>
endif
