return {
  'mrjones2014/smart-splits.nvim',
  keys = {
    { 'r<Left>',  function() require('smart-splits').resize_left() end,  desc = 'Split resize left' },
    { 'r<Down>',  function() require('smart-splits').resize_down() end,  desc = 'Split resize down' },
    { 'r<Up>',    function() require('smart-splits').resize_up() end,    desc = 'Split resize up' },
    { 'r<Right>', function() require('smart-splits').resize_right() end, desc = 'Split resize right' },
    { 'rh',       function() require('smart-splits').resize_left() end,  desc = 'Split resize left' },
    { 'rj',       function() require('smart-splits').resize_down() end,  desc = 'Split resize down' },
    { 'rk',       function() require('smart-splits').resize_up() end,    desc = 'Split resize down' },
    { 'rl',       function() require('smart-splits').resize_right() end, desc = 'Split resize right' },
  },
  -- init = function()
  --   local smart_splits = require('smart-splits')
  --
  --   vim.keymap.set('n', 'r<Left>', smart_splits.resize_left, { noremap = true, desc = "Split resize left" })
  --   vim.keymap.set('n', 'r<Down>', smart_splits.resize_down, { noremap = true, desc = "Split resize down" })
  --   vim.keymap.set('n', 'r<Up>', smart_splits.resize_up, { noremap = true, desc = "Split resize up" })
  --   vim.keymap.set('n', 'r<Right>', smart_splits.resize_right, { noremap = true, desc = "Split resize right" })
  --   vim.keymap.set('n', 'rh', smart_splits.resize_left, { noremap = true, desc = "Split resize left" })
  --   vim.keymap.set('n', 'rj', smart_splits.resize_down, { noremap = true, desc = "Split resize down" })
  --   vim.keymap.set('n', 'rk', smart_splits.resize_up, { noremap = true, desc = "Split resize down" })
  --   vim.keymap.set('n', 'rl', smart_splits.resize_right, { noremap = true, desc = "Split resize right" })
  -- end,
  opts = {
    -- Ignored filetypes (only while resizing)
    ignored_filetypes = {
      'nofile',
      'quickfix',
      'qf',
      'prompt',
    },
    -- Ignored buffer types (only while resizing)
    ignored_buftypes = { 'nofile' },
    -- when moving cursor between splits left or right,
    -- place the cursor on the same row of the *screen*
    -- regardless of line numbers.
    -- Can be overridden via function parameter, see Usage.
    move_cursor_same_row = false,

    -- ignore these autocmd events (via :h eventignore) while processing
    -- smart-splits.nvim computations, which involve visiting different
    -- buffers and windows. These events will be ignored during processing,
    -- and un-ignored on completed. This only applies to resize events,
    -- not cursor movement events.
    ignored_events = {
      'BufEnter',
      'WinEnter',
    },
    -- enable or disable the tmux integration
    tmux_integration = false,
    -- disable tmux navigation if current tmux pane is zoomed
    disable_tmux_nav_when_zoomed = false,
  },
}
