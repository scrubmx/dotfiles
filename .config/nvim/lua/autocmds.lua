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

-- Check if we need to reload the file (if there are changes)
local focusGained = vim.api.nvim_create_augroup('FocusGainedGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'FocusGained', 'WinEnter', 'TermClose', 'TermLeave' }, {
  group = focusGained,
  command = 'silent! checktime',
})

-- Autosave files when they lose focus
local focusLost = vim.api.nvim_create_augroup('FocusLostGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'FocusLost', 'WinLeave', 'TermOpen', 'TermEnter' }, {
  -- vim.api.nvim_create_autocmd({ 'FocusLost', 'WinLeave', 'BufLeave' }, {
  group = focusLost,
  command = 'silent! update',
  -- pattern = '!NeoTree*',
  -- callback = function(ev)
  --   local buf_modified = vim.api.nvim_buf_get_option(ev['buf'], 'modified')
  --   if buf_modified == true then
  --     vim.schedule(function() vim.cmd('write') end)
  --   end
  -- end
})

-- Turn off paste mode when leaving insert mode
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste',
  group = vim.api.nvim_create_augroup('SetPasteGroup', { clear = true }),
})

-- Set conceallevel to conceal links and other stuff in norg files
vim.cmd [[autocmd BufNewFile,BufRead *.md setlocal conceallevel=1]]
vim.cmd [[autocmd BufNewFile,BufRead *.norg setlocal conceallevel=2]]

-- Set indentation width for specific filetypes
vim.cmd [[autocmd FileType php setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab]]
vim.cmd [[autocmd FileType blade setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab]]

-- Set the filetypes for specific file extensions
vim.cmd [[autocmd BufNewFile,BufRead *.blade.php setlocal filetype=blade]]
vim.cmd [[autocmd BufNewFile,BufRead *.css setlocal filetype=css]]
vim.cmd [[autocmd BufNewFile,BufRead *.zsh-theme setlocal filetype=zsh]]

-- vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]

-- Override theme colors
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#111111' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#cc9057' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })

-- vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = '#e55561' })
-- vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = '#e2b86b' })
-- vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = '#48b0bd' })
-- vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = '#bf68d9' })
