-- Plugin to move any selection in any direction (Part of mini.nvim library)
-- https://github.com/echasnovski/mini.move
return {
  'echasnovski/mini.move',
  version = '*',
  event = 'VeryLazy',
  opts = {
    -- Options which control moving behavior
    options = {
      -- Automatically reindent selection during linewise vertical move
      reindent_linewise = true,
    },

    mappings = {
      -- Move visual selection in Visual mode.(Ctrl + Cmd + hjkl)
      left = '<C-M-h>',
      right = '<C-M-l>',
      down = '<C-M-j>',
      up = '<C-M-k>',

      -- Move current line in Normal mode
      line_left = '<C-M-h>',
      line_right = '<C-M-l>',
      line_down = '<C-M-j>',
      line_up = '<C-M-k>',
    },
  },
}
