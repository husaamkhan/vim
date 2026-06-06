"""""""""""
"  LSP    "
"""""""""""

set updatetime=300
set signcolumn=yes

lua << EOF
-- prevent the built-in vim.lsp.completion autotrigger from selecting the first item
vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})

local on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
  local opts = { buffer = bufnr, silent = true }

  vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
  vim.keymap.set('i', '<C-Space>', vim.lsp.completion.get, opts)
  -- trigger LSP completion after typing 1+ keyword character
  vim.api.nvim_create_autocmd('TextChangedI', {
    buffer = bufnr,
    callback = function()
      local word = vim.fn.matchstr(vim.fn.getline('.'), '\\k\\+$')
      if #word >= 1 then vim.lsp.completion.get() end
    end,
  })

  vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,     opts)
  vim.keymap.set('n', 'gy',         vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation,  opts)
  vim.keymap.set('n', 'gr',         vim.lsp.buf.references,      opts)
  vim.keymap.set('n', 'K',          vim.lsp.buf.hover,           opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,          opts)
  vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action,     opts)
  vim.keymap.set('n', '<leader>f',  vim.lsp.buf.format,          opts)
  vim.keymap.set('n', '[g',         vim.diagnostic.goto_prev,    opts)
  vim.keymap.set('n', ']g',         vim.diagnostic.goto_next,    opts)

  vim.keymap.set('i', '<Tab>',   function()
    return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
  end, { buffer = bufnr, expr = true })
  vim.keymap.set('i', '<S-Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
  end, { buffer = bufnr, expr = true })
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.lsp.start({
      name = 'clangd',
      cmd = { 'clangd' },
      on_attach = on_attach,
      root_dir = vim.fs.root(0, { '.git', 'Makefile', 'compile_commands.json' }),
    })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python' },
  callback = function()
    vim.lsp.start({
      name = 'pylsp',
      cmd = { 'pylsp' },
      on_attach = on_attach,
      root_dir = vim.fs.root(0, { '.git', 'setup.py', 'pyproject.toml' }),
    })
  end,
})
EOF
