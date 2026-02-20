"""""""""""""
"  PLUGINS  "
"""""""""""""

call plug#begin()

""" Start of plugins """

" autocompletions, syntax highlighting, etc.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" theme
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'morhetz/gruvbox'

" Better git functionality
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Multi cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

""" End of plugins """

call plug#end()

