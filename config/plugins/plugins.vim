"""""""""""""
"  PLUGINS  "
"""""""""""""

call plug#begin()

""" Start of plugins """

" autocompletions, syntax highlighting, etc.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" auto pairing braces, quotation marks, etc.
Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" theme
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }

""" End of plugins """

call plug#end()

