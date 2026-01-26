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
        onedark_dark = { 
            fg = "#ffffff",
            red = "#ffffff",
        },
    }
})

vim.cmd[[ colorscheme default ]]
