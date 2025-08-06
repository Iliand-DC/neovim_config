local lint = require 'lint'
require('linting.sv').setupLinter(lint)

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'TextChanged', 'InsertLeave' }, {
    group = vim.api.nvim_create_augroup('nvim_lint', { clear = true }),
    callback = function()
        vim.defer_fn(function()
            -- try_lint() will run every linter configured with linters_by_ft().
            lint.try_lint()
        end, 1)
    end,
})
