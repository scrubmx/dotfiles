-- https://github.com/xiyaowong/transparent.nvim
return {
  'xiyaowong/transparent.nvim',
  lazy = true,
  cond = false, -- This plugin will not be loaded
  priority = 85,
  opts = {
    groups = {
      'Normal',
      'NormalNC',
      'Comment',
      'Constant',
      'Special',
      'Identifier',
      'Statement',
      'PreProc',
      'Type',
      'Underlined',
      'Todo',
      'String',
      'Function',
      'Conditional',
      'Repeat',
      'Operator',
      'Structure',
      'LineNr',
      'NonText',
      'SignColumn',
      'CursorLineNr',
      'EndOfBuffer',
    },
    extra_groups = {
      -- 'NormalFloat',
      'NvimTreeNormal',

      -- NeoTree
      -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/8c89efb93b8383666a6f989762c2f610f5f2c930/lua/neo-tree/ui/highlights.lua#L9-L55
      'NeotreeNormal',
      'NeotreeNormalNC',
      'NeoTreeVertSplit',
      'NeoTreeEndOfBuffer',
      -- 'NeoTreeExpander',
    },
    exclude_groups = {
      'NormalFloat',
    },   -- table: groups you don't want to clear
  },

  -- Bufferline
  -- https://github.com/xiyaowong/transparent.nvim#usage
  -- vim.g.transparent_groups = vim.list_extend(
  --   vim.g.transparent_groups or {},
  --   vim.tbl_map(function(v)
  --     return v.hl_group
  --   end, vim.tbl_values(require('bufferline.config').highlights))
  -- )
}
