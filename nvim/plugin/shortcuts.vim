" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-K> [e
nmap <C-J> ]e
" Bubble multiple lines
vmap <C-K> [egv
vmap <C-J> ]egv

map //  :nohlsearch<CR>

" strip trailing whitespace
"nnoremap <silent> <leader><space> mm:%s/\s\+$//e<CR>`m

"nmap sj :TSJSplit<cr>
"nmap sk :TSJJoin<cr>
nmap <Leader>a :Ag<space>
nmap <Leader>r :RG<CR>

" run set test lib
map <Leader>R :TestFile<CR>
map <Leader>rn :TestNearest<CR>
map <Leader>rr :TestLast<CR>

"command S Subvert

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Presing jj get back to normal mode
inoremap jj <esc>
inoremap jk <esc>

inoremap <c-c> <ESC>
