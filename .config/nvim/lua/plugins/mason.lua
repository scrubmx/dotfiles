return {
  {
    'williamboman/mason.nvim',
    lazy = true,
    build = ':MasonUpdate',
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
    },
    config = true,
  },
}
