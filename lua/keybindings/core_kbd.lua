local map = vim.keymap.set


map('n', '<leader>d', vim.diagnostic.open_float, {desc='Open diagnostic window'})
