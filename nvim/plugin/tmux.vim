augroup TmuxSettings
  autocmd!
  " Rename Tmux window
  if exists('$TMUX')
    au BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")
    au VimLeave * call system("tmux setw automatic-rename")
  endif
augroup end

