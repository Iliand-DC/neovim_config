local lsp = vim.lsp

lsp.config['jedi_ls'] = {
    cmd = {'jedi-language-server'},
    filetypes = {'python'},
    root_markers = {'.git'},
}

lsp.enable('jedi_ls')
