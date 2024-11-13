return {
  -- https://github.com/navarasu/onedark.nvim
  --
  -- Plugins Supported:
  -- * https://github.com/navarasu/onedark.nvim#plugins-supported
  --
  -- Another great theme:
  -- * https://github.com/tiagovla/tokyodark.nvim
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 100,
  config = function()
    local onedark = require('onedark')

    onedark.setup({
      style = 'darker',
      transparent = true,
      term_colors = false,
      ending_tildes = false,
      cmp_itemkind_reverse = false,
      toggle_style_key = nil, -- Toggle style, nil to disable it, or for example '<leader>ts'
      toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' },
      code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'none',
        strings = 'none',
        variables = 'none'
      },
      -- https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/highlights.lua
      -- highlights = {},
      -- https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
      colors = {
        black = '#0e1013',
        bg0 = '#111315', -- Customized, options: '#080808', '#040404', '#111111', '#151820', '#1f2329'
        bg1 = '#282c34',
        bg2 = '#30363f',
        bg3 = '#323641',
        bg_d = '#181b20',
        bg_blue = '#61afef',
        bg_yellow = '#e8c88c',
        fg = '#a0a8b7',
        purple = '#bf68d9',
        green = '#8ebd6b',
        orange = '#cc9057',
        blue = '#4fa6ed',
        yellow = '#e2b86b',
        cyan = '#48b0bd',
        red = '#e55561',
        -- grey = '#535965',
        grey = '#43484f',
        light_grey = '#7a818e',
        dark_cyan = '#266269',
        dark_red = '#8b3434',
        dark_yellow = '#835d1a',
        dark_purple = '#7e3992',
        diff_add = '#272e23',
        diff_delete = '#2d2223',
        diff_change = '#172a3a',
        diff_text = '#274964',
      },
      lualine = {
        transparent = false,
      },
      diagnostics = {
        darker = true,
        background = true,
      },
    })

    -- Enable theme, same as `colorscheme onedark`
    onedark.load()
  end,
}
