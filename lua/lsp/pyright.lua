local config = {
    cmd = {'pyright-langserver', '--stdio'},
    filetypes = {'python'},
    root_markers = {'.git', 'pyproject.toml'},
    on_attach = function(client, bufnr)
      vim.lsp.completion.enable(true, client.id, bufnr, {
        autotrigger = true,
        convert = function(item)
          return { abbr = item.label:gsub("%b()", "") }
        end,
      })
    end
}

vim.lsp.config("pyright_ls", config)
vim.lsp.enable('pyright_ls')
