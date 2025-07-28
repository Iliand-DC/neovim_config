local map = vim.keymap.set
local unmap = vim.keymap.del


unmap('t', '<leader>t')

map("n", "<leader>tn", ":tabn<CR>", {desc="Next tab"})
map("n", "<leader>tp", ":tabp<CR>", {desc="Previous tab"})
map("n", "<leader>tw", ":tabnew<CR>", {desc="New tab"})

map("n", "<leader>tn", ":tabn<CR>", {desc="Next tab"})
map("n", "<leader>tp", ":tabp<CR>", {desc="Previous tab"})
