local map = vim.keymap.set


map('n', 'H', ':BufferLineCyclePrev<CR>', {desc="Move to previous tab", silent=true})
map('n', 'L', ':BufferLineCycleNext<CR>', {desc="Move to next tab", silent=true})

-- map('n', '<leader>bd', ':bd <CR>', {desc='Close current buffer', silent=true})
map('n', '<leader>bk', ':BufferLinePickClose<CR>', {desc="Close buffer", silent=true})
map('n', '<leader>o', '')
map('n', '<leader>o', ':BufferLinePick<CR>', {desc="Pick buffer from buffer line", silent=true})
map('n', '<leader>z', ':BufferLineCloseOthers<CR>', {desc="Close all buffers except current", silent=true})
map('n', '<leader>k', ':BufferLineCyclePrev<CR> :BufferLineCloseRight<CR>', {desc='Close current buffer', silent=true})
