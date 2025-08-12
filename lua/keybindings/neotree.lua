local map = vim.keymap.set


map("n", "<leader>e", "")

map("n", "<leader>e", ":Neotree toggle<CR>", {desc="Open/close navigation tree", silent=true})
