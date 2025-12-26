local map = vim.keymap.set


map('n', '<leader>d', vim.diagnostic.open_float, {desc='Open diagnostic window'})
map('i', '<C-s>', '<Esc>:w<Enter>', {desc = 'Change to normal mode and save'})
map('t', '<Esc>', [[<C-\><C-n>]])
map('n', '<C-s>', '<Esc>:w<Enter>', {desc = 'Change to normal mode and save'})
map('n', '<Esc><Esc>', ':noh<Enter>', {silent=true})
