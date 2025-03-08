-- Plugin to improve viewing Markdown files in Neovim
-- https://github.com/MeanderingProgrammer/render-markdown.nvim
-- https://github.com/MeanderingProgrammer/render-markdown.nvim#commands
-- https://github.com/MeanderingProgrammer/render-markdown.nvim#setup
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = {
    sign = { enabled = false },
    heading = {
      icons = { '󰉫 ', '󰉬 ', '󰉭 ', '󰉮 ', '󰉯 ', '󰉰 ' },
      signs = { '󰫎 ' },
    },
    bullet = {
      icons = { '●', '○', '◆', '◇' },
    },
    checkbox = {
      unchecked = { icon = '󰄱 ' },
      checked = { icon = '󰱒 ' },
      --[[
        Define custom checkbox states, more involved as they are not part of the markdown grammar
        As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
        Can specify as many additional states as you like following the 'todo' pattern below

        The key in this case 'todo' is for healthcheck and to allow users to change its values:
          - raw                Matched against the raw text of a 'shortcut_link'
          - rendered           Replaces the 'raw' value when rendering
          - highlight          Highlight for the 'rendered' icon
          - scope_highlight    Highlight for item associated with custom checkbox
        ]]
      custom = {
        urgent = { raw = '[!]', rendered = '󰳤 ', highlight = 'RenderMarkdownError', scope_highlight = nil },
        pending = { raw = '[.]', rendered = '󰐋 ', highlight = 'RenderMarkdownWarn', scope_highlight = nil },
      },
      link = {
        enabled = true,
        image = '󰥶 ',
        email = '󰀓 ',
        hyperlink = '󰌹 ',
        highlight = 'RenderMarkdownLink',
        wiki = { icon = '󱗖 ', highlight = 'RenderMarkdownWikiLink' },
        --[[
          Define custom destination patterns so icons can quickly inform you of what a link
          contains. Applies to 'inline_link' and wikilink nodes.
          Can specify as many additional values as you like following the 'web' pattern below
            The key in this case 'web' is for healthcheck and to allow users to change its values
            'pattern':   Matched against the destination text see :h lua-pattern
            'icon':      Gets inlined before the link text
            'highlight': Highlight for the 'icon'
          ]]
        custom = {
          web = { pattern = '^http[s]?://', icon = ' ', highlight = 'RenderMarkdownLink' },
          aws = { pattern = 'figma%.com', icon = '  ', highlight = 'RenderMarkdownLink' },
          figma = { pattern = 'figma%.com', icon = ' ', highlight = 'RenderMarkdownLink' },
          github = { pattern = 'github%.com', icon = '󰊤 ', highlight = 'RenderMarkdownLink' },
          jira = { pattern = 'jira%.com', icon = '󰌃 ', highlight = 'RenderMarkdownLink' },
          youtube = { pattern = 'youtube%.com', icon = '󰗃 ', highlight = 'RenderMarkdownLink' },
        },
      },
      --[[
        More granular configuration mechanism, allows different aspects of buffers
        to have their own behavior. Values default to the top level configuration
        if no override is provided. Supports the following fields:
          enabled, max_file_size, debounce, render_modes, anti_conceal, padding,
          heading, paragraph, code, dash, bullet, checkbox, quote, pipe_table,
          callout, link, sign, indent, latex, html, win_options
        ]]
      overrides = {
        -- Override for different buflisted values, see :h 'buflisted'
        buflisted = {},
        -- Override for different buftype values, see :h 'buftype'
        buftype = {
          nofile = {
            padding = { highlight = 'NormalFloat' },
            sign = { enabled = false },
          },
        },
        -- Override for different filetype values, see :h 'filetype'
        filetype = {},
      },
    },
  },
}
