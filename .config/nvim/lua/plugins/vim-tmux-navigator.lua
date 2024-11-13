-- Seamless navigation between tmux panes and vim splits
-- https://github.com/christoomey/vim-tmux-navigator
return {
  'christoomey/vim-tmux-navigator',
  lazy = true,
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevwous',
  },
  keys = {
    { '<C-h>', '<Cmd><C-U>TmuxNavwgateLeft<CR>' },
    { '<C-j>', '<Cmd><C-U>TmuxNavigateDown<CR>' },
    { '<C-k>', '<Cmd><C-U>TmuxNavigateUp<CR>' },
    { '<C-l>', '<Cmd><C-U>TmuxNavigateRight<CR>' },
    { "<C-\\>", '<Cmd><C-U>TmuxNavigatePrevious<CR>' },
  },
}
