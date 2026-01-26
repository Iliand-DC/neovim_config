local lsp = vim.lsp

lsp.config['veryl'] = {
    cmd = {'veryl-ls'},
    filetypes = {'veryl'},
    root_markers = {'.git'}
}

lsp.enable('veryl')
