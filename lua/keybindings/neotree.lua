local map = vim.keymap.set


map("n", "<leader>e", "")

map("n", "<leader>e", ":Neotree<CR>", {desc="Open navigation tree", silent=true})
map("n", "<leader>b", ":Neotree close<CR>", {desc="Close navigation tree", silent=true})
