local config = {
    cmd = {'gopls'},
    filetypes = {'go'},
    root_markers = {'.git', 'go.mod'},
    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true, 
        })
    end
}

vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.go",
        group = "AutoFormat",
        callback = function()
            vim.cmd("silent !gofmt -w %")            
            vim.cmd("edit")
        end,
    }
)

vim.lsp.config('gopls_ls', config)
vim.lsp.enable('gopls_ls')
