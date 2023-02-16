local status, smart_splits = pcall(require, 'smart-splits')

if (not status) then return end

smart_splits.setup({
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
})

vim.keymap.set('n', 'r<Left>', smart_splits.resize_left, { noremap = true })
vim.keymap.set('n', 'r<Down>', smart_splits.resize_down, { noremap = true })
vim.keymap.set('n', 'r<Up>', smart_splits.resize_up, { noremap = true })
vim.keymap.set('n', 'r<Right>', smart_splits.resize_right, { noremap = true })

vim.keymap.set('n', 'rh', smart_splits.resize_left, { noremap = true })
vim.keymap.set('n', 'rj', smart_splits.resize_down, { noremap = true })
vim.keymap.set('n', 'rk', smart_splits.resize_up, { noremap = true })
vim.keymap.set('n', 'rl', smart_splits.resize_right, { noremap = true })
