let g:polyglot_disabled = ['typescript']
so ~/.config/nvim/bundle.vim

let mapleader = ","

" sensible settings
set clipboard+=unnamedplus

"let g:clipboard = {
      "\   'name': 'lemonade',
      "\   'copy': {
      "\      '+': ['~/code/lemonade/lemonade', 'copy', '-'],
      "\      '*': ['~/code/lemonade/lemonade', 'copy', '-'],
      "\    },
      "\   'paste': {
      "\      '+': ['~/code/lemonade/lemonade', 'paste', '-'],
      "\      '*': ['~/code/lemonade/lemonade', 'paste', '-'],
      "\   },
      "\   'cache_enabled': 1,
      "\ }
set encoding=utf-8
set wildoptions=pum
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class
set hidden
set wrap
set expandtab
set shell=bash
set backspace=indent,eol,start
set shiftround
set backupdir=~/.cache/nvim
set directory=~/.cache/nvim
set hlsearch
set incsearch
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set softtabstop=2
set splitright

" fast
set lazyredraw
set timeoutlen=450
set updatetime=250

" fancy
set cursorline
set colorcolumn=80
set termguicolors
set cmdheight=2
set nonumber
set laststatus=2
set scrolloff=5
set list lcs=trail:·,tab:»·
set pumblend=30
set completeopt=noinsert,menuone
set background=dark
colorscheme gruvbox
let &sbr=nr2char(8618).' '
set signcolumn=yes
hi SignColumn guibg='#1d2021'
hi GitGutterAdd guibg='#1d2021' guifg='#b8bb26'
hi GitGutterChange guibg='#1d2021' guifg='#fabd2f'
hi GitGutterDelete guibg='#1d2021' guifg='#cc241d'
hi GitGutterChangeDelete guibg='#1d2021' guifg='#fb4934'

if has("mouse")
  set mouse=a
endif

"let g:polyglot_disabled = ['autoindent']

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "ruby",     -- one of "all", "language", or a list of languages
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}
EOF
