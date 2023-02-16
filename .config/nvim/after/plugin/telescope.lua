local status, telescope = pcall(require, 'telescope')

if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- function telescope_buffer_dir()
--   return vim.fn.expand('%:p:h')
-- end

-- https://github.com/kabinspace/AstroVim/blob/main/lua/configs/telescope.lua
telescope.setup({
  defaults = {
    path_display = { 'truncate' },
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
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
      '.vscode',
      'bootstrap',
      'node_modules',
      'public',
      'storage',
    },
    mappings = {
      n = {
        ['q'] = actions.close,
        ['<esc>'] = actions.close,
        ['<CR>'] = actions.select_default,
        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
        ['<Down>'] = actions.move_selection_next,
        ['<Up>'] = actions.move_selection_previous,
        ['<PageUp>'] = actions.results_scrolling_up,
        ['<PageDown>'] = actions.results_scrolling_down,
      },
    },
  },
})

vim.keymap.set('n', '<Leader>f', builtin.find_files, {})
vim.keymap.set('n', '<Leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>h', builtin.help_tags, {})


-- https://github.com/nvim-telescope/telescope-file-browser.nvim
telescope.load_extension('file_browser')

vim.keymap.set('n', '<Leader>b', '<Cmd>Telescope file_browser<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>r', '<Cmd>Telescope lsp_document_symbols<CR>', { noremap = true })
