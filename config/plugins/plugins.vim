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

" Better git functionality
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

""" End of plugins """

call plug#end()

