-- Soothing pastel theme for Neovim
-- https://github.com/catppuccin/nvim
-- https://github.com/catppuccin/nvim#configuration
--
-- Catppuccin Color Palette
-- https://catppuccin.com/palette
return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      default_integrations = true,
      transparent_background = true,
      -- List of supported plugins and their corresponding integration module
      -- https://github.com/catppuccin/nvim#integrations
      integrations = {
        -- diffview = true,
        -- neotest = true,
        -- noice = true,
        -- ufo = true,
        cmp = true,
        gitsigns = true,
        harpoon = true,
        indent_blankline = { enabled = true },
        markdown = true,
        mason = true,
        mini = {
          enabled = true,
          indentscope_color = '#1e1e2e',
        },
        neotree = true,
        notify = true,
        render_markdown = true,
        telescope = { enabled = true },
        treesitter = true,
        which_key = true,
      },
    })

    vim.cmd.colorscheme('catppuccin-mocha')
  end,
}
