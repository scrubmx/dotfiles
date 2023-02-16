local status, treesitter_configs = pcall(require, 'nvim-treesitter.configs')

if (not status) then return end

treesitter_configs.setup({
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
  ensure_installed = {
    'bash',
    'clojure',
    'css',
    'diff',
    'dot',
    'eex',
    'elixir',
    'erlang',
    'heex',
    'help',
    'html',
    'http',
    'javascript',
    'jsdoc',
    'json',
    'json5',
    'lua',
    'markdown',
    'php',
    'phpdoc',
    'python',
    'regex',
    'ruby',
    'rust',
    'scss',
    'sql',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vue',
    'yaml',
  },
  autotag = {
    enable = true,
  },
})
