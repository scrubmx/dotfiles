-- https://github.com/jwalton512/vim-blade
-- Define some single Blade directives. This variable is used for highlighting only.
-- vim.cmd([[ let g:blade_custom_directives = ['alpine'] ]])
vim.g['blade_custom_directives'] = { 'alpine' }

-- Define pairs of Blade directives. This variable is used for highlighting and indentation.
-- vim.cmd([[ let g:blade_custom_directives_pairs = { 'markdown': 'endmarkdown' } ]])
vim.g['blade_custom_directives_pairs'] = {
  markdown = 'endmarkdown',
  cache = 'endcache',
}
