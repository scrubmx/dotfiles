-- https://github.com/nvim-neotest/neotest
-- :h neotest.output
-- :h neotest.summary
-- :h neotest.diagnostic
return {
  'nvim-neotest/neotest',
  event = 'VeryLazy',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim', -- Plugin is deprecated

    -- Adapters
    'nvim-neotest/neotest-plenary', -- Optional
    'olimorris/neotest-phpunit',
    'jfpedroza/neotest-elixir',
    'haydenmeade/neotest-jest',
    'rouge8/neotest-rust',
  },
  keys = {
    { '<Leader>tt', function() require("neotest").run.run() end,                     desc = 'Run test under cursor' },
    { '<Leader>tf', function() require("neotest").run.run(vim.fn.expand("%")) end,   desc = 'Run all tests on a file' },
    { '<Leader>tr', function() require("neotest").output.open({ enter = true }) end, desc = 'Open the test results panel' },
    { '<Leader>tp', function() require("neotest").output_panel.toggle() end,         desc = 'Toggle the test results panel' },
    { '<Leader>ts', function() require("neotest").summary.toggle() end,              desc = 'Toggle the test summary panel' },
  },
  -- init = function()
  --   local map = vim.keymap.set
  --
  --   local opts = function(overrides)
  --     return vim.tbl_extend('force', { noremap = true, silent = true, nowait = true, }, overrides or {})
  --   end
  --
  --   map('n', '<Leader>tt', '<Cmd>lua require("neotest").run.run()<CR>', opts({ desc = 'Run test under cursor' }))
  --   map('n', '<Leader>tf', '<Cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts({ desc = 'Run all tests on a file' }))
  --   map('n', '<Leader>tr', '<Cmd>lua require("neotest").output.open({ enter = true })<CR>', opts({ desc = 'Open the test results panel' }))
  --   map('n', '<Leader>tp', '<Cmd>lua require("neotest").output_panel.toggle()<CR>', opts({ desc = 'Toggle the test results panel' }))
  --   map('n', '<Leader>ts', '<Cmd>lua require("neotest").summary.toggle()<CR>', opts({ desc = 'Toggle the test summary panel' }))
  -- end,
  config = function()
    -- https://github.com/nvim-neotest/neotest/blob/e46eae5739c470aa011ee43108ea8a730736174e/lua/neotest/config/init.lua

    local lib = require("neotest.lib")

    require('neotest').setup({
      log_level = vim.log.levels.WARN,
      consumers = {},
      quickfix = {
        enabled = false,
        open = false,
      },
      output = {
        enabled = true,
        open_on_run = "short",
      },
      output_panel = {
        enabled = true,
        open = "botright split | resize 15",
      },
      diagnostic = {
        enabled = true,
        severity = vim.diagnostic.severity.ERROR,
      },
      status = {
        enabled = true,
        virtual_text = false,
        signs = true,
      },
      state = {
        enabled = true,
      },
      run = {
        enabled = true,
      },
      adapters = {
        -- https://github.com/nvim-neotest/neotest-plenary
        require('neotest-plenary'),

        -- PHPUnit
        -- https://github.com/olimorris/neotest-phpunit
        require('neotest-phpunit')({
          filter_dirs = { '.git', 'node_modules', 'vendor' },
        }),

        require('neotest-elixir')({
          -- The Mix task to use to run the tests
          -- Can be a function to return a dynamic value.
          -- Default: "test"
          mix_task = 'test',
          -- Other formatters to pass to the test command as the formatters are overridden
          -- Can be a function to return a dynamic value.
          -- Default: {"ExUnit.CLIFormatter"}
          extra_formatters = { 'ExUnit.CLIFormatter', 'ExUnitNotifier' },
          -- Extra arguments to pass to mix test
          -- Can be a function that receives the position, to return a dynamic value
          -- Default: {}
          args = { '--color' },
          -- Delays writes so that results are updated at most every given milliseconds
          -- Decreasing this number improves snappiness at the cost of performance
          -- Can be a function to return a dynamic value.
          -- Default: 1000
          write_delay = 1000,
        }),

        -- Jest
        require('neotest-jest')({
          -- jestCommand = 'jest --watch ',
          jestCommand = 'npm test --',
          jestConfigFile = 'custom.jest.config.ts',
          env = { CI = true },
          cwd = function(_path)
            return vim.fn.getcwd()
          end,
        }),

        -- Rust
        require('neotest-rust'),
      },
      watch = {
        enabled = true,
        symbol_queries = {
          python = [[
            ;query
            ;Captures imports and modules they're imported from
            (import_from_statement (_ (identifier) @symbol))
            (import_statement (_ (identifier) @symbol))
          ]],
          lua = [[
            ;query
            ;Captures module names in require calls
            (function_call
              name: ((identifier) @function (#eq? @function "require"))
              arguments: (arguments (string) @symbol))
          ]],
          elixir = function(root, content)
            local query = lib.treesitter.normalise_query(
              "elixir",
              [[;; query
                (call (identifier) @_func_name
                  (arguments (alias) @symbol)
                  (#match? @_func_name "^(alias|require|import|use)")
                  (#gsub! @symbol ".*%.(.*)" "%1")
                )
              ]]
            )
            local symbols = {}

            for _, match, metadata in query:iter_matches(root, content) do
              for id, node in pairs(match) do
                local name = query.captures[id]

                if name == "symbol" then
                  local start_row, start_col, end_row, end_col = node:range()
                  if metadata[id] ~= nil then
                    local real_symbol_length = string.len(metadata[id]["text"])
                    start_col = end_col - real_symbol_length
                  end

                  symbols[#symbols + 1] = { start_row, start_col, end_row, end_col }
                end
              end
            end

            return symbols
          end,
        },
        filter_path = nil,
      },
      projects = {},
      icons = {
        -- running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
        running_animated = { "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥" },
        -- passed = "",
        -- running = "",
        -- failed = "",
        -- skipped = "",
        -- unknown = "",
        passed = "",
        running = "",
        failed = "",
        skipped = "",
        unknown = "",
        non_collapsible = "─",
        collapsed = "─",
        expanded = "╮",
        child_prefix = "├",
        final_child_prefix = "╰",
        child_indent = "│",
        final_child_indent = " ",
        -- watching = "",
        watching = "󰮔",
        notify = "",
      },
      highlights = {
        passed = 'NeotestPassed',
        running = 'NeotestRunning',
        failed = 'NeotestFailed',
        skipped = 'NeotestSkipped',
        test = 'NeotestTest',
        namespace = 'NeotestNamespace',
        focused = 'NeotestFocused',
        file = 'NeotestFile',
        dir = 'NeotestDir',
        border = 'NeotestBorder',
        indent = 'NeotestIndent',
        expand_marker = 'NeotestExpandMarker',
        adapter_name = 'NeotestAdapterName',
        select_win = 'NeotestWinSelect',
        marked = 'NeotestMarked',
        target = 'NeotestTarget',
        unknown = 'NeotestUnknown',
        watching = 'NeotestWatching',
      },
      floating = {
        border = "rounded",
        max_height = 0.6,
        max_width = 0.6,
        options = {},
      },
      default_strategy = "integrated",
      strategies = {
        integrated = {
          width = 120,
          height = 40,
        },
      },
      summary = {
        enabled = true,
        count = true,
        animated = true,
        follow = true,
        expand_errors = true,
        open = 'botright vsplit | vertical resize 50',
        mappings = {
          expand = { '<CR>', '<2-LeftMouse>' },
          expand_all = 'e',
          output = 'o',
          short = 'O',
          attach = 'a',
          jumpto = 'i',
          stop = 'u',
          run = 'r',
          debug = 'd',
          mark = 'm',
          run_marked = 'R',
          debug_marked = 'D',
          clear_marked = 'M',
          target = 't',
          clear_target = 'T',
          next_failed = 'J',
          prev_failed = 'K',
          watch = 'w',
          help = "?",
        },
      },
    })
  end
}
