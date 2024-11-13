-- Plugin to remove buffers (Part of mini.nvim library)
-- https://github.com/echasnovski/mini.comment
return {
  'echasnovski/mini.comment',
  version = '*',
  event = 'VeryLazy',
  opts = {
    options = {
      -- Options which control module behavior
      -- custom_commentstring = function()
      --  return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
      -- end,
      custom_commentstring = nil,

      -- Whether to ignore blank lines
      ignore_blank_line = false,

      -- Whether to ensure single space pad for comment parts
      pad_comment_parts = true,
    },

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      -- Toggle comment (like `gcip` - comment inner paragraph) for both
      -- Normal and Visual modes
      comment = 'gc',

      -- Toggle comment on current line
      comment_line = 'gcc',

      -- Define 'comment' textobject (like `dgc` - delete whole comment block)
      textobject = 'gc',
    },
  },
}
