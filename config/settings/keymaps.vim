"""""""""""""
"  KEYMAPS  "
"""""""""""""

let mapleader = " "

""" BUFFERS """
" Switch to next/previous buffer
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

" Open new buffer
nnoremap <leader>be :e 

" Close buffer
nnoremap <leader>bc :bw

" Open fuzzy finder
nnoremap <leader>F :Files<CR>

" Split current line into multiple indented lines
function! SplitLineIntoLines()
  let line = getline('.')
  let indent = matchstr(line, '^\s*')
  let inner_indent = indent . '    '
  let line = substitute(line, '{\s*', '{\n' . inner_indent, '')
  let line = substitute(line, '\s*,\s*', ',\n' . inner_indent, 'g')
  let line = substitute(line, '\s*}', '\n' . indent . '}', '')
  call setline('.', split(line, '\n'))
endfunction
nnoremap <leader>sl :call SplitLineIntoLines()<CR>
