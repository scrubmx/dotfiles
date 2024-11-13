-- Plugin that displays possible keybindings when you start typing a command
-- https://github.com/folke/which-key.nvim
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  -- config = true,
  opts = {
    win = { border = 'rounded' },
  },
  -- TODO: Add keybindings for this
  -- config = function()
  --   require('which-key').register({
  --     ['<Space>'] = {
  --       name = '+lsp',
  --       a = { 'lua vim.lsp.buf.code_action()', 'Code Actions' },
  --       e = { },
  --       f = { 'lua vim.lsp.buf.format({ async = true })', 'Format' },
  --       q = { },
  --       r = { 'lua vim.lsp.buf.rename()', 'Rename' },
  --     },
  --   })
  -- end,
}
