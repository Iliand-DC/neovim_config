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

vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.py",
        group = "AutoFormat",
        callback = function()
            vim.cmd("silent !ruff format %")            
            vim.cmd("edit")
        end,
    }
)

vim.lsp.config("pyright_ls", config)
vim.lsp.enable('pyright_ls')
