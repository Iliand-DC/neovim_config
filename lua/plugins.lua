local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })
Plug('tpope/vim-surround')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('nvim-neo-tree/neo-tree.nvim')
Plug('folke/flash.nvim')
Plug('akinsho/bufferline.nvim')
Plug('nvimdev/galaxyline.nvim')
Plug('MunifTanjim/nui.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('NeogitOrg/neogit')
Plug('nvim-lualine/lualine.nvim')
Plug('L3MON4D3/LuaSnip', {['tag'] = 'v2.*', ['do'] = 'make install_jsregexp'})
Plug('neovim/nvim-lspconfig')
Plug('rafamadriz/friendly-snippets')
Plug('akinsho/toggleterm.nvim', {['tag'] = '*'})
Plug('windwp/nvim-autopairs')
Plug('s1n7ax/nvim-window-picker')
Plug('folke/tokyonight.nvim')
Plug('sphamba/smear-cursor.nvim')
Plug('folke/which-key.nvim')
Plug('mfussenegger/nvim-lint')
Plug('echasnovski/mini.icons')


vim.call('plug#end')
