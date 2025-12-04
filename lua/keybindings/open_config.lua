local map = vim.keymap.set


map("n", "<leader>hc", ":e ~/.config/nvim/init.lua<CR>:cd ~/.config/nvim/<CR>", {desc="Open config file"})
map("n", "<leader>hv", ":e ~/.vimrc<CR>", {desc="Open vim config"})
