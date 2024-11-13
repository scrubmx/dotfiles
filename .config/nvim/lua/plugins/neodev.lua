-- https://github.com/folke/neodev.nvim
-- Make sure to setup neodev BEFORE lspconfig!
--
-- TODO: Replace this plugin with lazydev.nvim since neodev is now abandoned.
-- https://github.com/folke/lazydev.nvim
return {
  'folke/neodev.nvim',
  event = 'VeryLazy',
  opts = {
    library = {
      plugins = { 'neotest' },
      types = true,
    },
  },
}
