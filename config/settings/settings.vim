""""""""""""""
"  SETTINGS  "
""""""""""""""

set background=dark
colorscheme ayu-dark

set relativenumber
set number

" Show tabs and file status + open file name on top
set showtabline=2
set laststatus=2

set scrolloff=8

set encoding=utf-8

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
set smartindent
"set autoindent

set termguicolors

" Prevents cursor from changing from solid rectangle
set guicursor=

if g:colors_name ==# 'ayu'
  highlight LineNr guifg=#8A9199
  highlight CursorLineNr guifg=#E6B450 gui=bold

  highlight Visual guibg=#3E4B59
  highlight VisualNOS guibg=#3E4B59
endif

