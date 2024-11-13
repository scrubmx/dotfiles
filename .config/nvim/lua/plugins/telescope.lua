return {
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim'
    },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = 'Telescope',
    keys = {
      -- https://github.com/nvim-telescope/telescope.nvim#pickers
      -- https://github.com/nvim-telescope/telescope.nvim#vim-pickers
      { '<Leader>ff', function() require('telescope.builtin').find_files() end,  desc = 'Telescope find_files' },
      { '<Leader>fa','<Cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>',  desc = 'Telescope find_all' },
      { '<Leader>fd', function() require('telescope.builtin').diagnostics() end,  desc = 'Telescope diagnostics' },
      { '<Leader>fg', function() require('telescope.builtin').live_grep() end,  desc = 'Telescope live_grep' },
      { '<Leader>fo', function() require('telescope.builtin').buffers() end,  desc = 'Telescope buffers' },
      { '<Leader>fr', function() require('telescope.builtin').oldfiles() end,  desc = 'Telescope oldfiles' },
      { '<Leader>fs', function() require('telescope.builtin').spell_suggest() end,  desc = 'Telescope spell_suggest' },
      { '<Leader>fi', '<Cmd>Telescope lsp_document_symbols<CR>' },
      { '<Leader>fw', '<Cmd>Telescope lsp_workspace_symbols<CR>' },
      { '<Leader>fz', '<Cmd>Telescope current_buffer_fuzzy_find<CR>' },
      { '<Leader>fb', '<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>' },
    },
    -- init = function()
    --   local builtin = require('telescope.builtin')
    --   local opts = { nowait = true, silent = true, noremap = true }
    --
    --   -- https://github.com/nvim-telescope/telescope.nvim#pickers
    --   -- https://github.com/nvim-telescope/telescope.nvim#vim-pickers
    --   vim.keymap.set('n', '<Leader>ff', builtin.find_files, vim.tbl_extend('keep', opts, { desc = 'Telescope find_files' }))
    --   vim.keymap.set('n', '<Leader>fa', '<Cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', vim.tbl_extend('keep', opts, { desc = 'Telescope find_all' }))
    --   vim.keymap.set('n', '<Leader>fd', builtin.diagnostics, vim.tbl_extend('keep', opts, { desc = 'Telescope diagnostics' }))
    --   vim.keymap.set('n', '<Leader>fg', builtin.live_grep, vim.tbl_extend('keep', opts, { desc = 'Telescope live_grep' }))
    --   vim.keymap.set('n', '<Leader>fo', builtin.buffers, vim.tbl_extend('keep', opts, { desc = 'Telescope buffers' }))
    --   vim.keymap.set('n', '<Leader>fr', builtin.oldfiles, vim.tbl_extend('keep', opts, { desc = 'Telescope oldfiles' }))
    --   vim.keymap.set('n', '<Leader>fs', builtin.spell_suggest, vim.tbl_extend('keep', opts, { desc = 'Telescope spell_suggest' }))
    --   vim.keymap.set('n', '<Leader>fi', '<Cmd>Telescope lsp_document_symbols<CR>', opts)
    --   vim.keymap.set('n', '<Leader>fw', '<Cmd>Telescope lsp_workspace_symbols<CR>', opts)
    --   vim.keymap.set('n', '<Leader>fz', '<Cmd>Telescope current_buffer_fuzzy_find<CR>', opts)
    --   vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', opts)
    -- end,
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local themes = require('telescope.themes')
      local fb_actions = telescope.extensions.file_browser.actions

      telescope.setup({
        defaults = {
          theme = 'onedark',
          -- theme = themes.get_dropdown({ layout_config = { prompt_position = 'top' } }),
          prompt_prefix = ' ',
          selection_caret = ' ',
          path_display = { 'truncate' },
          selection_strategy = 'reset',
          sorting_strategy = 'ascending',
          winblend = 0,
          -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          preview = {
            filesize_limit = 25,
          },
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_ignore_patterns = {
            '.DS_Store',
            '.git',
            '.idea',
            '.next',
            '.vscode',
            'bootstrap',
            'node_modules',
            'public',
            'storage',
          },
          mappings = {
            i = {
              ['<C-c>'] = actions.close,
              ['<C-u>'] = actions.preview_scrolling_up,
              ['<C-d>'] = actions.preview_scrolling_down,
              ['<C-n>'] = actions.move_selection_next,
              ['<C-p>'] = actions.move_selection_previous,
              ['<Down>'] = actions.move_selection_next,
              ['<Up>'] = actions.move_selection_previous,
              ['<PageUp>'] = actions.results_scrolling_up,
              ['<PageDown>'] = actions.results_scrolling_down,
              ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
              ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
              ['<CR>'] = actions.select_default,
              ['<C-x>'] = actions.select_horizontal,
              ['<C-v>'] = actions.select_vertical,
              ['<C-t>'] = actions.select_tab,
              ['<C-w>'] = actions.which_key,
            },
            n = {
              ['<Esc>'] = actions.close,
              ['<C-u>'] = actions.preview_scrolling_up,
              ['<C-d>'] = actions.preview_scrolling_down,
              ['<Down>'] = actions.move_selection_next,
              ['<Up>'] = actions.move_selection_previous,
              ['<PageUp>'] = actions.results_scrolling_up,
              ['<PageDown>'] = actions.results_scrolling_down,
              ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
              ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
              ['<CR>'] = actions.select_default,
              ['<C-x>'] = actions.select_horizontal,
              ['<C-v>'] = actions.select_vertical,
              ['<C-t>'] = actions.select_tab,
              ['j'] = actions.move_selection_next,
              ['k'] = actions.move_selection_previous,
              ['gg'] = actions.move_to_top,
              ['G'] = actions.move_to_bottom,
              ['?'] = actions.which_key,
            },
          },
        },
        extensions = {
          file_browser = {
            hidden = true,
            hijack_netrw = true,
            mappings = {
              i = {
                ['<C-h>'] = fb_actions.toggle_hidden,
                ['<C-n>'] = fb_actions.create,
                ['<C-o>'] = fb_actions.open,
                ['<C-p>'] = fb_actions.move,
                ['<C-s>'] = fb_actions.toggle_all,
                ['<C-r>'] = fb_actions.rename,
                ['<C-x>'] = fb_actions.remove,
                ['<C-y>'] = fb_actions.copy,
              },
            },
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
          ['ui-select'] = {
            themes.get_dropdown({ layout_config = { prompt_position = 'top' } }),
          },
        },
        pickers = {
          buffers = {
            ignore_current_buffer = true,
            -- sort_mru = true,
            sort_lastused = true,
            previewer = true,
            find_files = {
              theme = 'dropdown',
            },
          },
        },
      })

      telescope.load_extension('file_browser')
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
    end,
  },
}
