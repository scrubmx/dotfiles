-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'nvim-tree/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'windwp/nvim-ts-autotag', requires = { 'nvim-treesitter/nvim-treesitter' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
  use { 'akinsho/toggleterm.nvim', tag = '*' }
  use { 'mg979/vim-visual-multi' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'lilydjwg/colorizer' }
  use { 'jwalton512/vim-blade' }
  use { 'simrat39/symbols-outline.nvim' }
  use { 'mrjones2014/smart-splits.nvim' }
  use { 'rcarriga/nvim-notify' }
  use { 'tpope/vim-fugitive' }
  use { 'folke/which-key.nvim' }

  use { 'zbirenbaum/copilot.lua' }
  use { 'zbirenbaum/copilot-cmp', after = { 'copilot.lua' } }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-tree/nvim-web-devicons' }, -- Optional
      { 'MunifTanjim/nui.nvim' },
    },
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional
      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      -- { 'rafamadriz/friendly-snippets' }, -- Optional
      -- Custom
      { 'onsails/lspkind.nvim' },
    }
  }

  -- "Atom One Dark" theme for neovim
  use { 'navarasu/onedark.nvim' }
end)
