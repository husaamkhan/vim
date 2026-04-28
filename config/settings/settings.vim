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

" Changes line number colours to make them easier to see
lua vim.api.nvim_set_hl(0, "LineNr", { fg = "#5C6773" })
lua vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E6B450", bold = true })

