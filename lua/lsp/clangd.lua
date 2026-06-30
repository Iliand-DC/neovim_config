local lsp = vim.lsp

lsp.config['clangd'] = {
    cmd = {'clangd'},
    filetypes = {'cpp'},
    root_markers = {'.git', 'src', 'CMakeLists.txt', 'Makefile', 'makefile'}
}
