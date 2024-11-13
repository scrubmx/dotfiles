-- Plugin to remove buffers (Part of mini.nvim library)
-- https://github.com/echasnovski/mini.bufremove
return {
  'echasnovski/mini.bufremove',
  -- stylua: ignore
  keys = {
    { '<Leader>bd', function() require('mini.bufremove').delete(0, false) end, desc = 'Delete Buffer' },
    { '<Leader>bD', function() require('mini.bufremove').delete(0, true) end,  desc = 'Delete Buffer (Force)' },
  },
}
