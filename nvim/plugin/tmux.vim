augroup tmux
  autocmd!
  if exists('$TMUX')

    autocmd BufReadPost,FileReadPost,BufNewFile,FocusGained * call system("tmux rename-window v:" . expand("%:p:t"))
    autocmd VimLeave,FocusLost * call system("tmux setw automatic-rename")
  endif
augroup END
