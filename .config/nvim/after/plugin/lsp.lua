local status, lsp_zero = pcall(require, 'lsp-zero')

if (not status) then return end

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
-- https://github.com/VonHeikemen/lsp-zero.nvim/wiki/Lua-template-configuration
lsp_zero.preset('recommended')

lsp_zero.ensure_installed({
  'intelephense',
  'jsonls',
  'lua_ls',
  'rust_analyzer',
  'solargraph',
})

-------------------------------------------------
-- LuaSnip
-------------------------------------------------

local luasnip = require('luasnip')

luasnip.config.set_config({
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave',
})

require('luasnip.loaders.from_vscode').lazy_load({
  paths = { '~/.config/nvim/snippets' },
})

-------------------------------------------------
-- Nvim Cmp
-------------------------------------------------

lsp_zero.setup_nvim_cmp({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'copilot', group_index = 2, keyword_length = 4 },
    { name = 'luasnip', group_index = 2, keyword_length = 2 },
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'path', group_index = 2 },
    { name = 'buffer', group_index = 2, keyword_length = 4 },
  },
  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol_text',
      maxwidth = 60,
    }),
  },
})

lsp_zero.on_attach(function(client, bufnr)
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v1.x/doc/md/lsp.md#default-keybindings

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<Space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Space>f', function() vim.lsp.buf.format({ async = true }) end, bufopts)

  local opts = { noremap = true, silent = true }

  vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<Space>q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', 'çn', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', 'çb', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', 'çp', vim.diagnostic.goto_prev, opts)
end)

-------------------------------------------------
-- Configure Language Servers
-------------------------------------------------

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v1.x/advance-usage.md#configuring-language-servers

lsp_zero.configure('intelephense', {
  settings = {
    intelephense = {
      licenceKey = '00BUZCUIJ0GA35S',
      telemetry = { enabled = false },
      format = { enable = false },
      diagnostics = { enable = true },
      environment = { phpVersion = '8.1.15' },
      completion = { insertUseDeclaration = true },
      phpdoc = {
        useFullyQualifiedNames = true,
        functionTemplate = {
          summary = '$1',
          tags = {
            "@param  ${1:$SYMBOL_TYPE}  $SYMBOL_NAME",
            "@return ${1:$SYMBOL_TYPE}",
            "@throws ${1:$SYMBOL_TYPE}"
          },
        },
      },
    },
  },
})

lsp_zero.configure('solargraph', {
  root_dir = require('lspconfig').util.root_pattern('.git', 'Gemfile', '.'),
  settings = {
    solargraph = {
      autoformat = true,
      completion = true,
      diagnostic = true,
      folding = false,
      references = true,
      rename = true,
      symbols = true,
    },
  },
})

lsp_zero.configure('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      telemetry = { enable = false },
      diagnostics = {
        globals = { 'vim' },
        neededFileStatus = { ['codestyle-check'] = 'Any' },
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = 'space',
          indent_size = '2',
        },
      },
    },
  },
})


-------------------------------------------------
-- Set Up
-------------------------------------------------

lsp_zero.nvim_workspace()
lsp_zero.setup()

vim.diagnostic.config({ virtual_text = true })
