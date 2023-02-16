-- Show cursor line only in active window
local cursorGroup = vim.api.nvim_create_augroup('CursorGroup', { clear = true })

vim.api.nvim_create_autocmd(
  { 'InsertLeave', 'WinEnter' },
  { pattern = '*', command = 'set cursorline', group = cursorGroup }
)
vim.api.nvim_create_autocmd(
  { 'InsertEnter', 'WinLeave' },
  { pattern = '*', command = 'set nocursorline', group = cursorGroup }
)

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd('FocusGained', { command = [[:checktime]] })

-- Turn off paste mode when leaving insert mode
vim.cmd [[autocmd InsertLeave * set nopaste]]

-- Set the filetype for Laravel blade files
vim.cmd [[autocmd BufNewFile,BufRead *.blade.php set filetype=blade]]
vim.cmd [[autocmd BufNewFile,BufRead *.zsh-theme set filetype=zsh]]

-- Set indentantion width for specific filetypes
vim.cmd [[autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab]]
vim.cmd [[autocmd FileType json setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab]]
vim.cmd [[autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab]]
vim.cmd [[autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab]]

-- Override theme colors
vim.cmd [[autocmd ColorScheme * highlight CursorLineNr ctermfg=254 guifg=#cc9057]]
