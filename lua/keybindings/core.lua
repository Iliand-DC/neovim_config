local map = vim.keymap.set


map('n', '<leader>di', vim.diagnostic.open_float, {desc='Open diagnostic window'})
map('i', '<C-s>', '<Esc>:w<Enter>', {desc = 'Change to normal mode and save'})
map('t', '<Esc>', [[<C-\><C-n>]])
map('n', '<C-s>', '<Esc>:w<Enter>', {desc = 'Change to normal mode and save'})
map('n', '<Esc><Esc>', ':noh<Enter>', {silent = true})
map('n', '<leader>rc', ':luafile ~/.config/nvim/', {desc = 'Load config file'})
map('n', '<leader>lf', ':luafile %<CR>', {desc = 'Load current Lua file'})
map('n', 'H', ':tabp<CR>', {desc = 'Previous tab'})
map('n', 'L', ':tabn<CR>', {desc = 'Next tab'})
