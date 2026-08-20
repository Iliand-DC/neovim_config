local map = vim.keymap.set

map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', {desc = 'LSP rename symbol'})
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', {desc = 'LSP find symbol definition'})
map('n', '<leader>gr', ':lua vim.lsp.buf.references()<CR>', {desc = 'LSP find symbol references'})
map('n', '<leader>a', ':lua vim.lsp.buf.code_action()<CR>', {desc = 'LSP code action'})
