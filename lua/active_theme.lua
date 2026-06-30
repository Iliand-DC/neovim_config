require("tokyonight").setup({
    style = "moon",
    on_colors = function(colors)
        colors.fg = "#ffffff"
    end
})

require("onedarkpro").setup({
    colors = {
        onedark_vivid = { 
            fg = "#dcdcdc",
        },
    }
})

vim.cmd[[ colorscheme tokyonight-moon ]]
