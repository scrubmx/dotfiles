-- https://github.com/NvChad/nvim-colorizer.lua
return {
  'NvChad/nvim-colorizer.lua',
  event = 'VeryLazy',
  opts = {
    filetypes = {
      '*',
      css = { css = true },
    },
    buftypes = {
      '*',
      '!prompt',               -- Exclude prompt buftypes from highlight
      '!popup',                -- Exclude popup buftypes from highlight
    },                         -- All the sub-options of filetypes apply to buftypes
    user_default_options = {
      RGB = true,              -- #RGB hex codes
      RRGGBB = true,           -- #RRGGBB hex codes
      names = false,           -- 'Name' codes like Blue or blue
      RRGGBBAA = false,        -- #RRGGBBAA hex codes
      AARRGGBB = false,        -- 0xAARRGGBB hex codes
      rgb_fn = false,          -- CSS rgb() and rgba() functions
      hsl_fn = false,          -- CSS hsl() and hsla() functions
      css = false,             -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false,          -- Enable all CSS *functions*: rgb_fn, hsl_fn
      mode = 'background',     -- Set the display mode. Options: 'background', 'foreground', 'virtualtext'
      tailwind = true,         -- Options: false, true, 'normal', 'lsp', 'both'. (true is same as normal)
      sass = {
        enable = false,        -- Enable sass colors
        parsers = { 'css' },   -- Parsers can contain values used in |user_default_options|
      },
      virtualtext = "■",
      -- Update color values even if buffer is not focused
      -- Example use: cmp_menu, cmp_docs
      always_update = false
    },
  },
}
