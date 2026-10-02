local map = vim.keymap.set

function SwitchTheme()
    local theme = vim.o.background
    print(theme)
    if theme == "light" then
        vim.o.background = "dark"
    else
        vim.o.background = "light"
    end
end

map('n', '<leader>ts', SwitchTheme, {desc = "Switch theme from light to dark and vice versa"})
