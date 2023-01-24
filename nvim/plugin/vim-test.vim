nnoremap <F5> :TestNearest<CR>
nnoremap <F6> :TestFile<CR>
let test#strategy = "neovim"
let g:test#neovim#start_normal = 1
let test#neovim#term_position = "vert"
autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif
