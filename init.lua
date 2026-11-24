-- CORE_SETTINGS
vim.g.mapleader = " "
vim.o.relativenumber = true
vim.o.number = true
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 10
vim.o.updatetime = 250
vim.o.scrolloff = 8
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
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.signcolumn = "yes"
vim.o.termguicolors = true


-- PLUGINS
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/junegunn/fzf",
  "https://github.com/nativerv/cyrillic.nvim",
  "https://github.com/tpope/vim-surround",
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
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

lsp.config["gopls_ls"] = {
    cmd = {"gopls"},
    filetypes = {"go"},
    root_markers = {".git", "go.mod"},
    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true, 
        })
    end
}

lsp.config["pyrefly"] = {
    cmd = {"pyrefly", "lsp"},
    filetypes = {"python"},
    root_markers = {".git", "pyproject.toml"},
}

lsp.config["ruff_ls"] = {
    cmd = {"ruff", "server"},
    filetypes = {"python"},
    root_markers = {".git", "pyproject.toml"},
}

lsp.config["rust-analyzer"] = {
	cmd = {"rust-analyzer"},
	filetypes = {"rust"},
	root_markers = {".git", "Cargo.toml"}
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

lsp.config["veryl"] = {
    cmd = {"veryl-ls"},
    filetypes = {"veryl"},
    root_markers = {".git"}
}

-- lsp.enable("gopls_ls")
-- lsp.enable("veryl")
-- lsp.enable("veridian_ls")
-- lsp.enable("rust-analyzer")
-- lsp.enable("pyrefly")


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
require("lualine").setup({
    sections = {
        lualine_x = {},
    }
})


-- NEO_TREE
require("neo-tree").setup({
    window = {
        mappings = {
          ["l"] = {
            "open"
          },
          ["h"] = function(state)
            local node = state.tree:get_node()
              if node.type == "directory" and node:is_expanded() then
                require"neo-tree.sources.filesystem".toggle_directory(state, node)
              else
                require"neo-tree.ui.renderer".focus_node(state, node:get_parent_id())
              end
            end,
        }
    }
})


-- TOGGLETERM
require("toggleterm").setup({
    size = 10,
    open_mapping = [[<C-\>]],
    autochdir = true,
})


-- KEYBINDINGS
local map = vim.keymap.set
map("n", "H", ":BufferLineCyclePrev<CR>", { desc = "Move to previous tab", silent = true })
map("n", "L", ":BufferLineCycleNext<CR>", { desc = "Move to next tab", silent = true })
map("n", "<leader>bk", ":BufferLinePickClose<CR>", { desc = "Close buffer", silent = true })
map("n", "<leader>o", "")
map("n", "<leader>o", ":BufferLinePick<CR>", { desc = "Pick buffer from buffer line", silent = true })
map("n", "<leader>z", ":BufferLineCloseOthers<CR>", { desc = "Close all buffers except current", silent = true })
map("n", "<leader>di", vim.diagnostic.open_float, { desc = "Open diagnostic window" })
map("i", "<C-s>", "<Esc>:w<Enter>", { desc = "Change to normal mode and save" })
map("t", "<Esc>", [[<C-\><C-n>]])
map("n", "<C-s>", "<Esc>:w<Enter>", { desc = "Change to normal mode and save" })
map("n", "<Esc><Esc>", ":noh<Enter>", {silent = true })
map("n", "<leader>rc", ":luafile ~/.config/nvim/", { desc = "Load config file" })
map("n", "<leader>lf", ":luafile %<CR>", { desc = "Load current Lua file" })
map("n", "H", ":tabp<CR>", { desc = "Previous tab" })
map("n", "L", ":tabn<CR>", { desc = "Next tab" })
map("n", "<leader>ka", ":%bd<CR>:e#<CR>", {  desc = "Kill all buffers except current one", silent = true  })
map("n", "gh", "0", { desc = "Go to start of the line" })
map("n", "gl", "$", { desc = "Go to end of the line" })
map("n", "gp", "%", { desc = "Go to pair symbol" })
map("n", "s", function() require("flash").jump() end, { desc = "Flash" })

map("n", "<leader>e", ":Neotree toggle position=right <CR>", { desc = "Open/close navigation tree", silent = true })

map("n", "<C-h>", "<C-w>h", { desc = "Move to left panel" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom panel" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top panel" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right panel" })
map("n", "<C-,>", "<C-w><", { desc = "Decrease width" })
map("n", "<C-.>", "<C-w>>", { desc = "Increase width" })

map("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
map("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })
map("n", "<leader>tw", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
map("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })

