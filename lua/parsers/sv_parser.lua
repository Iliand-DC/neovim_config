vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
callback = function()
  require('nvim-treesitter.parsers').systemverilog = {
      install_info = {
        url = "https://github.com/gmlarumbe/tree-sitter-systemverilog.git", -- local path or git repo
        files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "master", -- default branch in case of git repo if different from master
      },
  }
end})
