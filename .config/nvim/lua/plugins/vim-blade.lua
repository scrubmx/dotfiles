-- Vim syntax highlighting for Blade templates
-- https://github.com/jwalton512/vim-blade
return {
  'jwalton512/vim-blade',
  lazy = true,
  ft = 'blade',
  init = function()
    vim.g['blade_custom_directives'] = { 'alpine' }
    vim.g['blade_custom_directives_pairs'] = {
      markdown = 'endmarkdown',
      cache = 'endcache',
    }
  end,
}
