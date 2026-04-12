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
  let line = substitute(line, '\s*}$', '\n' . indent . '}', '')
  let lines = split(line, '\n')
  call setline('.', lines[0])
  call append('.', lines[1:])
endfunction
nnoremap <leader>Js :call SplitLineIntoLines()<CR>

" Split chained method calls on dots onto indented new lines
function! SplitOnDots()
  let line = getline('.')
  let indent = matchstr(line, '^\s*')
  let parts = split(line, '\.')
  call setline('.', parts[0])
  call append('.', map(parts[1:], {_, v -> indent . '    .' . v}))
endfunction
nnoremap <leader>Jd :call SplitOnDots()<CR>
