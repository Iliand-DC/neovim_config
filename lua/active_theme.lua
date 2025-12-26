require("tokyonight").setup({
    -- use the night style
    style = "storm",
    -- change foreground color to white
    on_colors = function(colors)
        colors.fg = "#ffffff"
    end
})

require("onedarkpro").setup({
    colors = {
        red = "#c5c5cc"
    }
})

vim.cmd[[ colorscheme catppuccin-macchiato ]]
