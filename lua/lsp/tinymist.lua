local lsp = vim.lsp

lsp.config['tinymist'] = {
	cmd = {'tinymist'},
	filetypes = {'typst'},
	root_markers = {'.git', 'Cargo.toml', 'main.typ'}
}

lsp.enable('tinymist')
