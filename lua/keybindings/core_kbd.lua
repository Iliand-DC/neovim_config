local map = vim.keymap.set


map('n', '<leader>k', ':BufferLinePickClose<CR>', {desc="Close current buffer", silent=true})
