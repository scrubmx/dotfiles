-- Neorg is a tool for structured note taking, project, task management, and much more
-- https://github.com/nvim-neorg/neorg
-- https://github.com/nvim-neorg/neorg/wiki/Tangling
--
-- Default Keybindings
--   https://github.com/nvim-neorg/neorg/blob/6fece1546d051a5f2a2d932d5978beec1ef920ab/lua/neorg/modules/core/keybinds/keybinds.lua
-- Syntax
--   https://github.com/nvim-neorg/neorg/blob/main/doc/neorg.norg
-- Specification
--   https://github.com/nvim-neorg/norg-specs/blob/main/1.0-specification.norg
-- Semantics
--   https://github.com/nvim-neorg/norg-specs/blob/main/1.0-semantics.norg
return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true,   -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    'nvim-neorg/neorg',
    lazy = true,
    ft = 'norg',
    -- build = ':Neorg sync-parsers',
    dependencies = { 'luarocks.nvim' },
    opts = {
      load = {
        -- Loads default behaviour
        ['core.defaults'] = {},
        -- https://www.nerdfonts.com/cheat-sheet
        ['core.concealer'] = {
          config = {
            icons = {
              todo = {
                cancelled = { icon = 'x' }, -- 
                done = { icon = '' },
                on_hold = { icon = '⏸' },
                pending = { icon = '󰇘' }, -- , 󰇘, », , 󰼛
                recurring = { icon = '' },
                uncertain = { icon = '?' },
                urgent = { icon = '!' },
                undone = { icon = '×' },
              },
            },
          },
        },
        -- Manages Neorg workspaces
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/Documents/Notes',
              vector = '~/Code/Vector/notes',
            },
            default_workspace = 'notes',
            index = 'index.norg', -- The name of the main (root) .norg file
          },
        },
      },
    },
  },
}
