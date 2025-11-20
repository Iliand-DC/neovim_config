local lsp = vim.lsp

lsp.config['veridian_ls'] = {
    cmd = {'veridian'},
    filetypes = {'verilog', 'systemverilog'},
    root_markers = {'rtl.f', '.git'},
}

lsp.enable('veridian_ls')
