augroup tmux
  autocmd!
  if exists('$TMUX')

    autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window v:" . expand("%:p:t"))
    autocmd VimLeave * call system("tmux setw automatic-rename")
  endif
augroup END
