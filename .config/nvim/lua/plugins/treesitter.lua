return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'VeryLazy',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-refactor',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'RRethy/nvim-treesitter-textsubjects',
    'RRethy/nvim-treesitter-endwise',
    'windwp/nvim-ts-autotag',
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,

      -- https://github.com/windwp/nvim-ts-autotag#override-default-values
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { 'html', 'blade', 'eex' },
      },
      highlight = {
        enable = true,
        disable = {},
      },
      indent = {
        enable = true,
        disable = {
          'php',
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      refactor = {
        smart_rename = { enable = true, keymaps = { smart_rename = 'grr' } },
        highlight_definitions = { enable = true },
      },
      textsubjects = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['.'] = 'textsubjects-smart',
          [';'] = 'textsubjects-container-outer',
          ['i;'] = 'textsubjects-container-inner',
        },
      },
      endwise = { enable = true },
      matchup = { enable = true },

      -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
      ensure_installed = {
        'bash',
        'clojure',
        'css',
        'diff',
        'dot',
        'eex',
        'elixir',
        'erlang',
        'gleam',
        'graphql',
        'heex',
        'html',
        'http',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'json5',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'norg',
        'php',
        'phpdoc',
        'python',
        'regex',
        'ruby',
        'rust',
        'scss',
        'sql',
        'terraform',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'yaml',
      },
    })

    require('ts_context_commentstring').setup({
      enable_autocmd = false,
    })

    -- https://github.com/EmranMR/tree-sitter-blade
    -- https://github.com/EmranMR/tree-sitter-blade/discussions/19#discussion-5400675
    -- https://medium.com/@jogarcia/laravel-blade-on-neovim-ee530ff5d20d
    local parser_cofigs = require('nvim-treesitter.parsers').get_parser_configs()
    parser_cofigs.blade = {
      install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'blade',
    }

  end,
}
