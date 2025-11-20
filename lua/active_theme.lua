require('onedark').setup {
    style = 'deep',
    term_colors = false,
    colors = {
        fg = '#dddddd',
        bg = '#212236',
        red = '#fa707a',
        orange = '#ffe694'
    },
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'italic',
        strings = 'italic',
        variables = 'none'
    },
}

require("tokyonight").setup({
    -- use the night style
    style = "storm",
    -- change foreground color to white
    on_colors = function(colors)
        colors.fg = "#ffffff"
    end
})

vim.cmd[[ colorscheme onedark ]]
