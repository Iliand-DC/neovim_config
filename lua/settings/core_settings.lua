vim.g.mapleader = " "

vim.o.relativenumber = true
vim.o.number = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.wrap = true
vim.o.linebreak = true

vim.o.cmdheight = 0
vim.o.laststatus = 3

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.undofile = true
vim.o.swapfile = false

vim.o.completeopt = "menuone,noselect,fuzzy"
vim.o.autocomplete = true

-- turn off autocomplete in telescope window and bring it back after leaving
vim.cmd('autocmd FileType TelescopePrompt lua vim.o.autocomplete = false')
vim.cmd('autocmd BufLeave * if &filetype == "TelescopePrompt" | lua vim.o.autocomplete = true')
