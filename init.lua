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



-- PLUGINS
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/junegunn/fzf",
  "https://github.com/nativerv/cyrillic.nvim",
  "https://github.com/tpope/vim-surround",
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/akinsho/horizon.nvim",
  "https://github.com/NeogitOrg/neogit",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/brenton-leighton/multiple-cursors.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/akinsho/toggleterm.nvim",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/s1n7ax/nvim-window-picker",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/mfussenegger/nvim-lint",
  "https://github.com/echasnovski/mini.icons",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/loctvl842/monokai-pro.nvim",
  "https://github.com/maxmx03/solarized.nvim",
  "https://github.com/AlexvZyl/nordic.nvim",
  "https://github.com/ribru17/bamboo.nvim",
  "https://github.com/neanias/everforest-nvim",
  "https://github.com/WeiTing1991/suannhai.nvim",
  "https://github.com/mfussenegger/nvim-dap.git",
  "https://github.com/nvim-neotest/nvim-nio.git",
  "https://github.com/rcarriga/nvim-dap-ui.git",
  "https://github.com/Shatur/neovim-ayu.git",
  "https://github.com/f4z3r/gruvbox-material.nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/veryl-lang/veryl.vim",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
  "https://github.com/carlos-algms/agentic.nvim",
  "https://github.com/nchhillar2004/gemini.nvim",
  "https://github.com/projekt0n/github-nvim-theme",
  "https://github.com/felipeagc/fleet-theme-nvim",
})



-- THEME
vim.o.background = "dark"
vim.cmd.colorscheme("fleet")



-- KEYBINDINGS
local map = vim.keymap.set
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
map("n", "H", ":BufferLineCyclePrev<CR>", {desc="Move to previous tab", silent=true})
map("n", "L", ":BufferLineCycleNext<CR>", {desc="Move to next tab", silent=true})
map("n", "<leader>bk", ":BufferLinePickClose<CR>", {desc="Close buffer", silent=true})
map("n", "<leader>o", "")
map("n", "<leader>o", ":BufferLinePick<CR>", {desc="Pick buffer from buffer line", silent=true})
map("n", "<leader>z", ":BufferLineCloseOthers<CR>", {desc="Close all buffers except current", silent=true})
map("n", "<leader>k", ":BufferLineCyclePrev<CR> :BufferLineCloseRight<CR>", {desc="Close current buffer", silent=true})
map("n", "<leader>di", vim.diagnostic.open_float, {desc="Open diagnostic window"})
map("i", "<C-s>", "<Esc>:w<Enter>", {desc = "Change to normal mode and save"})
map("t", "<Esc>", [[<C-\><C-n>]])
map("n", "<C-s>", "<Esc>:w<Enter>", {desc = "Change to normal mode and save"})
map("n", "<Esc><Esc>", ":noh<Enter>", {silent = true})
map("n", "<leader>rc", ":luafile ~/.config/nvim/", {desc = "Load config file"})
map("n", "<leader>lf", ":luafile %<CR>", {desc = "Load current Lua file"})
map("n", "H", ":tabp<CR>", {desc = "Previous tab"})
map("n", "L", ":tabn<CR>", {desc = "Next tab"})
map("n", "<leader>ka", ":%bd<CR>:e#<CR>", { desc = "Kill all buffers except current one", silent = true })
map("n", "gh", "0", {desc = "Go to start of the line"})
map("n", "gl", "$", {desc = "Go to end of the line"})
map("n", "gp", "%", {desc = "Go to pair symbol"})
map("n", "s", function() require("flash").jump() end, {desc = "Flash"})
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", {desc = "LSP rename symbol"})
map("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", {desc = "LSP find symbol definition"})
map("n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>", {desc = "LSP find symbol references"})
map("n", "<leader>a", ":lua vim.lsp.buf.code_action()<CR>", {desc = "LSP code action"})
map("n", "<leader>e", "")
map("n", "<leader>e", ":Neotree toggle<CR>", {desc="Open/close navigation tree", silent=true})
map("n", "<leader>hc", ":e ~/.config/nvim/", {desc="Open config file"})
map("n", "<leader>hv", ":e ~/.vimrc<CR>", {desc="Open vim config"})
map("n", "<C-h>", "<C-w>h", {desc="Move to left panel"})
map("n", "<C-j>", "<C-w>j", {desc="Move to bottom panel"})
map("n", "<C-k>", "<C-w>k", {desc="Move to top panel"})
map("n", "<C-l>", "<C-w>l", {desc="Move to right panel"})
map("n", "<C-,>", "<C-w><", {desc="Decrease width"})
map("n", "<C-.>", "<C-w>>", {desc="Increase width"})
map("n", "<leader>tn", ":tabn<CR>", {desc="Next tab"})
map("n", "<leader>tp", ":tabp<CR>", {desc="Previous tab"})
map("n", "<leader>tw", ":tabnew<CR>", {desc="New tab"})
map("n", "<leader>tn", ":tabn<CR>", {desc="Next tab"})
map("n", "<leader>tp", ":tabp<CR>", {desc="Previous tab"})
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
map("n", "<F5>", function() require("dapui").open() require("dap").continue() end, {desc = "Continue"})
map("n", "<F6>", function() require("dap").close() require("dapui").close() end, {desc = "Close"})
map("n", "<F10>", function() require("dap").step_over() end, {desc = "Step Over"})
map("n", "<F11>", function() require("dap").step_into() end, {desc = "Step Into"})
map("n", "<F12>", function() require("dap").step_out() end, {desc = "Step Out"})
map("n", "<leader>b", function() require("dap").toggle_breakpoint() end, {desc = "Toggle Breakpoint"})
map("n", "<leader>B", function() require("dap").set_breakpoint() end, {desc = "Set Breakpoint"})
map("n", "<leader>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
map("n", "<leader>dr", function() require("dap").repl.open() end, {desc = "Open REPL"})
map("n", "<leader>dl", function() require("dap").run_last() end, {desc = "Run Last"})
map({"n", "l"}, "<leader>dh", function() require("dap.ui.widgets").hover() end)
map({"n", "v"}, "<leader>dp", function() require("dap.ui.widgets").preview() end)
map("n", "<leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end)
map("n", "<leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)
map("n", "<leader>dt", function() require("dapui").toggle() end, {desc = "Toggle DAP UI"})
map({ "n" }, "<C-\">", ":lua require(\"agentic\").toggle()<CR>", { desc = "Toggle Agentic Chat" })



-- TELESCOPE
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            }
        }
    }
})



-- DAP
local dap = require("dap")
dap.adapters.debugpy = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.python = {
  {
    type = "debugpy",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
    pythonPath = function()
      return "/usr/bin/python"
    end,
  },
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    args = {}, -- provide arguments if needed
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    pid = function()
      local name = vim.fn.input("Executable name (filter): ")
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = "${workspaceFolder}"
  },
  {
    name = "Attach to gdbserver :1234",
    type = "gdb",
    request = "attach",
    target = "localhost:1234",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}"
  }
}

dap.configurations.cpp = dap.configurations.c
require("nvim-dap-virtual-text").setup()
require("dapui").setup()



-- LINT
local lint = require "lint"

lint.linters_by_ft = {
    systemverilog = { "verilator" },
    verilog = { "verilator" },
}

local verilator = lint.linters.verilator

verilator.args = {
    "-Wall",
    "-Wno-MODDUP",
    "--timing",
    "--lint-only",
    "-f",
    vim.fs.find("rtl.f", {upward = true, stop = vim.env.HOME})[1],
}
lint.linters.verilator = verilator



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

lsp.config["jedi_ls"] = {
    cmd = {"jedi-language-server"},
    filetypes = {"python"},
    root_markers = {".git", "pyproject.toml"},
    on_attach = function(client, bufnr)
      vim.lsp.completion.enable(true, client.id, bufnr, {
        autotrigger = true,
        convert = function(item)
          return { abbr = item.label:gsub("%b()", "") }
        end,
      })
    end
}

lsp.config["pyright_ls"] = {
    cmd = {"pyright-langserver", "--stdio"},
    filetypes = {"python"},
    root_markers = {".git", "pyproject.toml"},
    on_attach = function(client, bufnr)
      vim.lsp.completion.enable(true, client.id, bufnr, {
        autotrigger = true,
        convert = function(item)
          return { abbr = item.label:gsub("%b()", "") }
        end,
      })
    end
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

lsp.enable("gopls_ls")
lsp.enable("veryl")
lsp.enable("veridian_ls")
lsp.enable("rust-analyzer")
lsp.enable("ruff_ls")
lsp.enable("pyright_ls")
lsp.enable("jedi_ls")



-- API
local api = vim.api
api.nvim_create_augroup("AutoFormat", {})

api.nvim_create_autocmd("User", { pattern = "TSUpdate",
callback = function()
  require("nvim-treesitter.parsers").systemverilog = {
      install_info = {
        url = "https://github.com/gmlarumbe/tree-sitter-systemverilog.git", 
        files = {"src/parser.c"}, 
        branch = "master", 
      },
  }
end})

api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.py",
        group = "AutoFormat",
        callback = function()
            vim.cmd("silent !ruff format %")            
            vim.cmd("edit")
        end,
    }
)

api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.go",
        group = "AutoFormat",
        callback = function()
            vim.cmd("silent !gofmt -w %")            
            vim.cmd("edit")
        end,
    }
)

api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" }, {
    group = api.nvim_create_augroup("nvim_lint", { clear = true }),
    callback = function()
        vim.defer_fn(function()
            -- try_lint() will run every linter configured with linters_by_ft().
            lint.try_lint()
        end, 1)
    end,
})

api.nvim_create_autocmd("FileType", {
  pattern = { "odin", "python", "c", "cpp", "jinja", "commonlisp", "xml"},
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
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
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



-- AGENTIC
require("agentic").setup({
    provider = "opencode-acp",
    acp_providers = {
        ["opencode-acp"] = {
            command = "opencode",
            args = { "acp" },
        }
    }
})



-- TOGGLETERM
require("toggleterm").setup({
    size = 10,
    open_mapping = [[<C-\>]],
    autochdir = true,
})
