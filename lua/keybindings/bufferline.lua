local map = vim.keymap.set


map('n', 'H', ':BufferLineCyclePrev<CR>', {desc="Move to previous tab", silent=true})
map('n', 'L', ':BufferLineCycleNext<CR>', {desc="Move to next tab", silent=true})
