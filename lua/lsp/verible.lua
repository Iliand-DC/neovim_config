require('lspconfig.configs').verible = {
    default_config = {
        cmd = {'verible-verilog-ls', 'lsp'},
        filetypes = {'systemverilog'};
        root_dir = function(fname)
            return lsp.util.find_git_ancestor(fname)
        end;
        settings = {'--rules=-parameter-name-style'};
    };
}

vim.lsp.enable('verible')
