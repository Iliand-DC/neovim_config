local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end


-- useins.lua
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Example with configuration options
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate', -- Command to run after installation/update
  }

  use {
	  'neoclide/coc.nvim',
	  run = 'npm ci'
  }
  use 'junegunn/fzf'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
  use 'nativerv/cyrillic.nvim'

  use 'tpope/vim-surround'
  use 'nvim-neo-tree/neo-tree.nvim'
  use 'folke/flash.nvim'

  use 'akinsho/bufferline.nvim'
  use 'nvimdev/galaxyline.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'akinsho/horizon.nvim'
  use "olimorris/onedarkpro.nvim"
  use 'NeogitOrg/neogit'
  use 'shaunsingh/nord.nvim'
  use 'nvim-lualine/lualine.nvim'
  use {
      'L3MON4D3/LuaSnip',
      run = 'make install_jsregexp'
  }

  use 'neovim/nvim-lspconfig'
  use 'rafamadriz/friendly-snippets'
  use 'romgrk/doom-one.vim'
  use 'iissnan/tangox'
  use 'akinsho/toggleterm.nvim'
  use 'windwp/nvim-autopairs'
  use 's1n7ax/nvim-window-picker'
  use 'folke/tokyonight.nvim'
  use 'sphamba/smear-cursor.nvim'
  use 'folke/which-key.nvim'
  use 'mfussenegger/nvim-lint'
  use 'echasnovski/mini.icons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'lewis6991/gitsigns.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

end)
