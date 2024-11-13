-- Plugin to remove buffers (Part of mini.nvim library)
-- https://github.com/echasnovski/mini.surround
--
-- Example: SomeRandomString. `saiw'` -> 'SomeRandomString'
return {
  'echasnovski/mini.surround',
  version = '*',
  event = 'VeryLazy',
  opts = {
    -- Add custom surroundings to be used on top of builtin ones. For more
    -- information with examples, see `:h MiniSurround.config`.
    custom_surroundings = nil, -- Module mappings. Use `''` (empty string) to disable one.

    mappings = {
      add = 'sa',            -- Add surrounding in Normal and Visual modes
      delete = 'sd',         -- Delete surrounding
      find = 'sf',           -- Find surrounding (to the right)
      find_left = 'sF',      -- Find surrounding (to the left)
      highlight = 'sh',      -- Highlight surrounding
      replace = 'sr',        -- Replace surrounding
      update_n_lines = 'sn', -- Update `n_lines`
      suffix_last = 'l',     -- Suffix to search with "prev" method
      suffix_next = 'n',     -- Suffix to search with "next" method
    },
  },
}
