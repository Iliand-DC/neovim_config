local lsp = vim.lsp

lsp.config['rust-analyzer'] = {
	cmd = {'rust-analyzer'},
	filetypes = {'rust'},
	root_markers = {'.git', 'Cargo.toml'}
}

lsp.enable('rust-analyzer')
