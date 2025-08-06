local map = vim.keymap.set


map('n', '<leader>k', ':BufferLinePickClose<CR>', {desc="Close buffer", silent=true})
map('n', '<leader>bd', ':bd <CR>', {desc='Close current buffer', silent=true})
map('n', '<leader>d', vim.diagnostic.open_float, {desc='Open diagnostic window'})
