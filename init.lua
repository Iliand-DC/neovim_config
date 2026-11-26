-- CORE_SETTINGS
vim.g.mapleader = " "
vim.o.number = true
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 10
vim.o.updatetime = 250
vim.o.scrolloff = 8
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.linebreak = true
vim.o.cmdheight = 0
vim.o.laststatus = 3
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.completeopt = "menuone,noselect,fuzzy"
vim.o.autocomplete = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.signcolumn = "yes"
vim.o.termguicolors = true


-- PLUGINS
vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/nativerv/cyrillic.nvim",
    "https://github.com/tpope/vim-surround",
    "https://github.com/folke/flash.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/akinsho/toggleterm.nvim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/s1n7ax/nvim-window-picker",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/echasnovski/mini.icons",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/Dmich98/caelus.nvim",
})


-- THEME
vim.cmd.colorscheme("caelus")


-- LSP
local lsp = vim.lsp
lsp.config["clangd"] = {
    cmd = {"clangd"},
    filetypes = {"cpp", "c"},
    root_markers = {".git", "src", "CMakeLists.txt", "Makefile", "makefile", "meson.build"}
}
lsp.config["pyright"] = {
    cmd = {"pyright-langserver", "--stdio"},
    filetypes = {"python"},
    root_markers = {".git", "pyproject.toml"},
}
lsp.config["ruff_ls"] = {
    cmd = {"ruff", "server"},
    filetypes = {"python"},
    root_markers = {".git", "pyproject.toml"},
}
lsp.config["tinymist"] = {
    cmd = {"tinymist"},
    filetypes = {"typst"},
    root_markers = {".git", "Cargo.toml", "main.typ"}
}
lsp.config["veridian_ls"] = {
    cmd = {"veridian"},
    filetypes = {"verilog", "systemverilog"},
    root_markers = {"rtl.f", ".git"},
}
lsp.enable("pyright")


-- API
local api = vim.api
api.nvim_create_autocmd("FileType", {
  pattern = { "python", "c", "cpp", "jinja", "xml", "bash" },
  callback = function() vim.treesitter.start() end,
})


-- AUTOPAIRS
require("nvim-autopairs").setup({map_cr = false})


-- CMP
local cmp = require "cmp"
cmp.setup({
  completion = {
    keyword_length = 1,
    keyword_pattern = "*",
  },
  mapping = {
    ["<Enter>"] = cmp.mapping.confirm({ select = true }),
    ["<Esc>"] = cmp.mapping.close(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
  },
  sources = {
    { name = "nvim_lsp" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})


-- CYRILLIC
require("cyrillic").setup()


-- FLASH
require("flash").setup({
  remote_op = {
    restore = true,
    motion = true,
  },
})


-- LUALINE
require('lualine').setup()


-- TOGGLETERM
require("toggleterm").setup({
    size = 10,
    open_mapping = [[<C-\>]],
    autochdir = true,
})


-- KEYBINDINGS
local map = vim.keymap.set
map("n", "<leader>di", vim.diagnostic.open_float, { desc = "Open diagnostic window" })
map("i", "<C-s>", "<Esc>:w<Enter>", { desc = "Change to normal mode and save" })
map("t", "<Esc>", [[<C-\><C-n>]])
map("n", "<C-s>", "<Esc>:w<Enter>", { desc = "Change to normal mode and save" })
map("n", "<Esc><Esc>", ":noh<Enter>", {silent = true })
map("n", "H", ":tabp<CR>", { desc = "Previous tab" })
map("n", "L", ":tabn<CR>", { desc = "Next tab" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to left panel" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom panel" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top panel" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right panel" })
map("n", "<C-,>", "<C-w><", { desc = "Decrease width" })
map("n", "<C-.>", "<C-w>>", { desc = "Increase width" })

map("n", "s", function() require("flash").jump() end, { desc = "Flash" })
map("n", "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
map("n", "<leader>f", ":FzfLua files<CR>", { desc = "Find file", silent = true })
map("n", "<leader>F", ":FZF<CR>", { desc = "Find file in all files", silent = true })
map("n", "<leader>c", ":FzfLua<CR>", { desc = "Find command", silent = true })
map("n", "<leader>b", ":FzfLua buffers<CR>", { desc = "Find buffer", silent = true })
map("n", "<leader>/", ":FzfLua grep<CR>", { desc = "Grep", silent = true })
