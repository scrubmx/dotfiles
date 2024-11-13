-- https://github.com/VonHeikemen/lsp-zero.nvim
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/guides/lazy-loading-with-lazy-nvim.md
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#custom-servers
return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  cmd = { 'LspInfo', 'LspInstall' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'lukas-reineke/cmp-under-comparator',
    {
      'zbirenbaum/copilot-cmp',
      dependencies = { 'zbirenbaum/copilot.lua' },
      config = function()
        require('copilot_cmp').setup({
          fix_pairs = true,
          event = { 'InsertEnter', 'LspAttach' },
          -- formatters = {
          --   insert_text = require('copilot_cmp.format').remove_existing,
          -- },
        })
      end
    },

    -- Snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'doxnit/cmp-luasnip-choice',

    -- Icons
    'onsails/lspkind.nvim',
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.preset('recommended')

    lsp_zero.on_attach(function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v1.x/doc/md/lsp.md#default-keybindings
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP Jump to declaration' }))
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP Jump to definition' }))
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP List all implementations' }))
      vim.keymap.set('n', 'go', vim.lsp.buf.type_definition,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP Jump to the type definition' }))
      vim.keymap.set('n', 'gr', vim.lsp.buf.references,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP List all references' }))
      vim.keymap.set('n', 'gs', vim.lsp.buf.document_symbol,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP Document symbols' }))
      vim.keymap.set('n', 'gS', vim.lsp.buf.workspace_symbol,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP Workspace symbols' }))
      -- vim.keymap.set('n', 'gp', "<Cmd> lua require('lsp.peek').Peek('definition')<CR>", bufopts)
      -- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP Display information about the symbol' }))
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP Display signature information' }))
      vim.keymap.set('n', '<Space>r', vim.lsp.buf.rename,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP Rename all symbol references' }))
      vim.keymap.set('n', '<Space>f', function() vim.lsp.buf.format({ async = true }) end,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP Format the current buffer' }))
      vim.keymap.set({ 'n', 'v' }, '<Space>a', vim.lsp.buf.code_action,
        vim.tbl_extend('keep', bufopts, { desc = 'LSP Display code actions menu' }))

      local opts = { noremap = true, silent = true }

      vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float,
        vim.tbl_extend('keep', opts, { desc = 'LSP Show diagnostics in a floating window' }))
      vim.keymap.set('n', '<Space>q', vim.diagnostic.setloclist,
        vim.tbl_extend('keep', opts, { desc = 'LSP Add buffer diagnostics to the location list' }))
      vim.keymap.set('n', 'çn', vim.diagnostic.goto_next,
        vim.tbl_extend('keep', opts, { desc = 'Move to the next diagnostic' }))
      vim.keymap.set('n', 'çb', vim.diagnostic.goto_prev,
        vim.tbl_extend('keep', opts, { desc = 'Move to the previous diagnostic' }))
      vim.keymap.set('n', 'çp', vim.diagnostic.goto_prev,
        vim.tbl_extend('keep', opts, { desc = 'Move to the previous diagnostic' }))
    end)


    -- https://lsp-zero.netlify.app/v3.x/reference/lua-api.html#set-server-config-opts
    -- https://lsp-zero.netlify.app/v3.x/guide/quick-recipes.html#enable-folds-with-nvim-ufo
    lsp_zero.set_server_config({
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
          }
        }
      }
    })


    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
    require('mason').setup()
    require('mason-lspconfig').setup({
      -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
      -- https://www.elixir-tools.dev/docs/next-ls/installation/#masonnvim
      -- https://github.com/elixir-tools/elixir-tools.nvim
      ensure_installed = {
        'bashls',
        'cssls',
        'dotls',
        'emmet_ls',
        'erlangls',
        'elixirls',
        'eslint',
        'graphql',
        'html',
        'intelephense',
        'phpactor',
        'jsonls',
        'lua_ls',
        'marksman',
        'pylsp',
        'rust_analyzer',
        'solargraph',
        'tailwindcss',
        'ts_ls',
        'volar',
      },
      handlers = {
        lsp_zero.default_setup,

        -- this first function is the "default handler"
        -- it applies to every language server without a "custom handler"
        function(server_name)
          require('lspconfig')[server_name].setup()
        end,

        -- Intelephense
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#intelephense
        -- https://github.com/bmewburn/intelephense-docs/blob/master/installation.md#configuration-options
        intelephense = function()
          require('lspconfig').intelephense.setup({
            -- init_options = { licenceKey = "00BUZCUIJ0GA35S" },
            settings = {
              intelephense = {
                telemetry = { enabled = false },
                format = { enable = false },
                diagnostics = { enable = false },
                environment = { phpVersion = '8.3.3' },
                completion = {
                  maxItems = 20, -- Default: 100
                  insertUseDeclaration = true,
                },
                phpdoc = {
                  -- useFullyQualifiedNames = true, -- Default: false (Overrides completion.insertUseDeclaration)
                  functionTemplate = {
                    summary = '$1',
                    tags = {
                      '@param  ${1:$SYMBOL_TYPE}  $SYMBOL_NAME',
                      '@return ${1:$SYMBOL_TYPE}',
                      '@throws ${1:$SYMBOL_TYPE}'
                    },
                  },
                },
              },
            },
          })
        end,

        -- PHPactor
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#phpactor
        -- https://phpactor.readthedocs.io/en/master/reference/configuration.html
        -- phpactor = function()
        --   local config = require('lspconfig').phpactor.manager.config
        --
        --   config['init_options'] = {
        --       ["docblock_missing_return"] = false,
        --       ["docblock_missing_param"] = false,
        --       ["docblock_missing_extends_tag"] = true,
        --       ["docblock_missing_implements_tag"] = true,
        --   }
        --
        --   require('lspconfig').phpactor.setup({})
        -- end,


        -- ElixirLS
        -- https://github.com/elixir-lsp/elixir-ls
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls
        elixirls = function()
          require('lspconfig').elixirls.setup({
            capabilities = lsp_zero.get_capabilities(),
            settings = {
              elixirLS = {
                dialyzerEnabled = true,
                enableTestLenses = false,
                fetchDeps = false,
                suggestSpecs = true,
                hint = { enabled = true },
              },
            },
          })
        end,


        -- EmmetLS
        -- https://github.com/aca/emmet-ls
        -- https://github.com/aca/emmet-ls#configuration
        -- https://github.com/emmetio/emmet/blob/54006706e42a6561317022e3f4ad13d9593e5f45/src/config.ts#L79-L267
        emmet_ls = function()
          local capability = vim.lsp.protocol.make_client_capabilities()
          capability.textDocument.completion.completionItem.snippetSupport = true

          require('lspconfig').emmet_ls.setup({
            filetypes = { "css",
              'elixir',
              'eruby',
              'heex',
              'html',
              'javascript',
              'javascriptreact',
              'less',
              'pug',
              'sass',
              'scss',
              'svelte',
              'typescriptreact',
              'vue'
            },
            settings = {
              emmet = {
                excludeLanguages = { 'markdown' },
                showExpandedAbbreviation = 'always',
                showAbbreviationSuggestions = true,
              },
            },
          })
        end,

      },
    })

    -- Solargraph
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solargraph
    -- lsp_zero.configure('solargraph', {
    --   root_dir = require('lspconfig').util.root_pattern('.git', 'Gemfile', '.'),
    --   settings = {
    --     solargraph = {
    --       autoformat = true,
    --       completion = true,
    --       diagnostic = true,
    --       folding = false,
    --       references = true,
    --       rename = true,
    --       symbols = true,
    --     },
    --   },
    -- })

    -- PyLSP
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
    -- lsp_zero.configure('pylsp', {
    --   root_dir = require('lspconfig').util.root_pattern('.git', 'pyproject.toml', 'setup.py', 'setup.cfg',
    --     'requirements.txt'),
    --   settings = {
    --     pylsp = {
    --       plugins = {
    --         pycodestyle = {
    --           ignore = { 'W391' },
    --           maxLineLength = 100,
    --         },
    --       },
    --     },
    --   },
    -- })

    -- -- Lua Language Server
    -- -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
    -- local lua_ls_settings = lsp_zero.nvim_lua_ls().settings.Lua
    --
    -- lsp_zero.configure('lua_ls', {
    --   settings = {
    --     Lua = {
    --       telemetry = { enable = false },
    --       runtime = {
    --         path = lua_ls_settings.runtime.path,
    --         version = lua_ls_settings.runtime.version,
    --       },
    --       diagnostics = {
    --         globals = { 'vim' },
    --         neededFileStatus = { ['codestyle-check'] = 'Any' },
    --       },
    --       workspace = {
    --         -- library = vim.api.nvim_get_runtime_file('', true),
    --         library = lua_ls_settings.workspace.library,
    --         checkThirdParty = false,
    --       },
    --       format = {
    --         enable = true,
    --         defaultConfig = {
    --           indent_style = 'space',
    --           indent_size = '2',
    --         },
    --       },
    --     },
    --   },
    -- })

    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#use-icons-in-the-sign-column
    lsp_zero.set_sign_icons({
      error = ' ',
      warn = ' ',
      info = ' ',
      hint = ' '
    })

    lsp_zero.setup()

    -- lsp_zero.extend_cmp()

    -- ⚠️  You need to setup `cmp` after lsp-zero
    -- https://github.com/VonHeikemen/lsp-zero.nvim#autocomplete

    -- You need to setup `cmp` after lsp-zero
    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()
    local lspkind = require('lspkind')

    require('cmp_luasnip_choice').setup({ auto_open = true })

    -- LuaSnip
    local luasnip = require('luasnip')
    luasnip.config.set_config({
      region_check_events = 'InsertEnter',
      delete_check_events = 'InsertLeave',
    })
    require('luasnip.loaders.from_vscode').lazy_load({ paths = { '~/.config/nvim/snippets' } })


    -- Nvim Cmp
    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    end

    cmp.setup({
      completion = {
        completeopt = 'menuone,noinsert,noselect',
      },
      performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 500,
        async_budget = 1,
        max_view_entries = 25,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- window = {
      --   completion = cmp.config.window.bordered({
      --     border = 'double',
      --     winhighlight = 'Normal:Normal,FloatBorder:Normal,Search:NONE',
      --   }),
      -- },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 60,
          ellipsis_char = '...',
        }),
      },
      -- formatting = {
      --   fields = { 'kind', 'abbr', 'menu' },
      --   format = function(entry, vim_item)
      --     local kind = require('lspkind').cmp_format { mode = 'symbol_text', maxwidth = 50 }(entry, vim_item)
      --     local strings = vim.split(kind.kind, '%s', { trimempty = true })
      --     kind.kind = ' ' .. strings[1] .. ' '
      --     kind.menu = '    (' .. strings[2] .. ')'
      --     return kind
      --   end,
      -- },
      sources = {
        { name = 'copilot',                 group_index = 1, priority = 1,      max_item_count = 3 },
        { name = 'nvim_lsp',                group_index = 1, priority = 2,      max_item_count = 3 },
        { name = 'nvim_lsp_signature_help', group_index = 1, priority = 3,      max_item_count = 2 },
        { name = 'luasnip',                 group_index = 2 },
        { name = 'luasnip_choice',          group_index = 2 },
        { name = 'nvim_lua',                group_index = 3 },
        { name = 'buffer',                  group_index = 4, keyword_length = 3 },
        { name = 'path',                    group_index = 5, keyword_length = 3 },
        -- https://github.com/hrsh7th/nvim-cmp/issues/1310#issuecomment-1326712312
        -- { name = 'cmdline',                 group_index = 6, keyword_length = 3 },
      },
      -- https://github.com/VonHeikemen/lsp-zero.nvim#keybindings-1
      mapping = cmp.mapping.preset.insert({
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<CR>'] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<Tab>'] = vim.schedule_wrap(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end),
        -- ['<Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() and has_words_before() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_locally_jumpable() then
        --     luasnip.expand_or_jump()
        --   elseif has_words_before() then
        --     cmp.complete()
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      -- experimental = {
      --   ghost_text = {
      --     hl_group = 'LspCodeLens',
      --   },
      -- },
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'cmdline' },
        { name = 'buffer' },
        { name = 'nvim_lsp_document_symbol' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' },
          },
        },
      }, {
        { name = 'path' },
        { name = 'buffer' },
      }),
    })

    vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]

    vim.diagnostic.config({
      float = {
        source = false,
        focusable = false,
        show_header = true,
        border = 'rounded',
        -- max_width = 80,
        -- max_height = 20,
      },
      virtual_text = true,
      underline = true,
      signs = false,
    })
  end
}
