local map = vim.keymap.set


map('n', '<C-h>', '<C-w>h', {desc="Move to left panel"})
map('n', '<C-j>', '<C-w>j', {desc="Move to bottom panel"})
map('n', '<C-k>', '<C-w>k', {desc="Move to top panel"})
map('n', '<C-l>', '<C-w>l', {desc="Move to right panel"})


map('n', '<C-,>', '<C-w><', {desc="Decrease width"})
map('n', '<C-.>', '<C-w>>', {desc="Increase width"})
