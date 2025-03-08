-----------------------------------------------------------
-- Auto Commands
-----------------------------------------------------------

-- Show cursor line only in active window
local cursorGroup = vim.api.nvim_create_augroup('CursorGroup', { clear = true })

vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
  desc = 'Enable `cursorline` when window gains focus',
  pattern = '*',
  command = 'set cursorline',
  group = cursorGroup,
})

vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
  desc = 'Disable `cursorline` when window loses focus',
  pattern = '*',
  command = 'setlocal nocursorline',
  group = cursorGroup,
})

-- Turn off paste mode when leaving insert mode
vim.api.nvim_create_autocmd('InsertLeave', {
  desc = 'Turn off paste mode when leaving insert mode',
  pattern = '*',
  command = 'set nopaste',
  group = vim.api.nvim_create_augroup('PasteGroup', { clear = true }),
})

-- Highlight when yanking text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('TextYankGroup', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set conceallevel to conceal links and other stuff in norg files
-- See `:help conceallevel`
--
--  0  Text is shown normally
--  1  Text is replaced with one character (fallbacks to `listchars`)
--  2  Text is hidden unless it has a custom replacement (see `:syn-cchar`)
--  3  Text is completely hidden
-- vim.cmd("autocmd BufNewFile,BufRead *.norg setlocal conceallevel=3")
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  desc = 'Set `conceallevel` for norg files (3 – Concealed text is completely hidden)',
  pattern = '*.norg',
  command = 'setlocal conceallevel=3',
  group = vim.api.nvim_create_augroup('ConcealLevelGroup', { clear = true }),
})

-- Set the filetypes for specific file extensions
-- vim.cmd("autocmd BufNewFile,BufRead *.blade.php setlocal filetype=blade")
-- vim.cmd("autocmd BufNewFile,BufRead *.zsh-theme setlocal filetype=zsh")
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  desc = 'Set the filetypes for specific file extensions',
  pattern = '*.zsh-theme',
  command = 'setlocal filetype=zsh',
  group = vim.api.nvim_create_augroup('FileTypeGroup', { clear = true }),
})

-- Set indentation width for specific filetypes
-- vim.cmd("autocmd FileType php setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab")
-- vim.cmd("autocmd FileType blade setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab")
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Set indentation width to 4 for specific filetypes',
  pattern = { '*.php', '*.blade.php' },
  command = 'setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab',
  group = vim.api.nvim_create_augroup('IndentationGroup', { clear = true }),
})

-- Undercurl (Let's try it out for a few days)
vim.cmd([[let &t_Cs = "\e[4:3m]"]])
vim.cmd([[let &t_Ce = "\e[4:0m]"]])

-----------------------------------------------------------
-- Override theme colors
-----------------------------------------------------------

-- Use Treesitter :Inspect command to view the AST
-- https://www.youtube.com/watch?v=MpnjYb-t12A
--
-- Theme Colors:
-- https://catppuccin.com/palette#flavor-mocha

-- Elixir Syntax ------------------------------------------

vim.cmd('highlight @string.special.symbol.elixir guifg=#89dceb')

-- Neorg Syntax -------------------------------------------

vim.cmd('highlight @neorg.anchors.declaration.norg guifg=#94e2d5')
vim.cmd('highlight @neorg.headings.1.title.norg guifg=#f38ba8')
vim.cmd('highlight @neorg.links.description.norg guifg=#74c7ec')
vim.cmd('highlight @neorg.links.location.url.norg guifg=#74c7ec')
vim.cmd('highlight @neorg.markup.spoiler guifg=#6c7086 guibg=none')
vim.cmd('highlight @neorg.todo_items.cancelled.norg guifg=#585b70')
vim.cmd('highlight @neorg.todo_items.on_hold.norg guifg=#74c7ec')
vim.cmd('highlight @neorg.todo_items.pending.norg guifg=#f9e2af')
vim.cmd('highlight @neorg.todo_items.urgent.norg guifg=#f38ba8')

-- vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
-- vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Normal' })
-- vim.api.nvim_set_hl(0, "BorderBG", { fg = "#9399b2" })
-- vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#cdd6f4' })
-- vim.api.nvim_set_hl(0, 'PmenuSel', { fg = '#f38ba8' })
