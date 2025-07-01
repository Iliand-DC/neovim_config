local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.systemverilog = {
  install_info = {
    url = "https://github.com/gmlarumbe/tree-sitter-systemverilog.git", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "master", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "sv", -- if filetype does not match the parser name
}
