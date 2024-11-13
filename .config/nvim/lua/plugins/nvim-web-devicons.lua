return {
  'nvim-tree/nvim-web-devicons',
  lazy = true,
  config = function()
    local web_dev_icons = require('nvim-web-devicons')

    web_dev_icons.setup({
      -- your personnal icons can go here (to override)
      -- you can specify color or cterm_color instead of specifying both of them
      -- DevIcon will be appended to `name`
      override = {},
      -- globally enable different highlight colors per icon (default to true)
      -- if set to false all icons will have the default icon's color
      color_icons = true,
      -- globally enable default icons (default to false)
      -- will get overriden by `get_icons` option
      default = true,
    })

    -- Override individual icons
    web_dev_icons.set_icon({
      norg = {
        icon  = '',
        color = '#48b0bd',
        cterm_color = '73',
        name  = 'norg',
      },
      zsh = {
        icon = '',
        color = '#8ebd6b',
        cterm_color = '65',
        name = 'zsh'
      },
    })
  end
}
