-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2
-- https://github.com/ThePrimeagen/harpoon
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  event = 'VeryLazy',
  dependencies = {
    -- 'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  -- keys = {
  --   -- https://github.com/ThePrimeagen/harpoon#-harpooning
  --   { '¡m', function() require('harpoon.mark').add_file() end, desc = 'Harpoon mark_file' },
  --   { '¡a', function() require('harpoon.mark').add_file() end, desc = 'Harpoon mark_file' },
  --   { '¡o', function() require('harpoon.ui').toggle_quick_menu() end, desc = 'Harpoon toggle_quick_menu' },
  --   { '¡n', function() require('harpoon.ui').nav_next() end, desc = 'Harpoon nav_next' },
  --   { '¡p', function() require('harpoon.ui').nav_prev() end, desc = 'Harpoon nav_prev' },
  --
  --   -- Switch to any mark without bringing up the menu
  --   { '¡1', function() require('harpoon.ui').nav_file(1) end, desc = 'Harpoon navigate to file 1' },
  --   { '¡2', function() require('harpoon.ui').nav_file(2) end, desc = 'Harpoon navigate to file 2' },
  --   { '¡3', function() require('harpoon.ui').nav_file(3) end, desc = 'Harpoon navigate to file 3' },
  --   { '¡4', function() require('harpoon.ui').nav_file(4) end, desc = 'Harpoon navigate to file 4' },
  --   { '¡5', function() require('harpoon.ui').nav_file(5) end, desc = 'Harpoon navigate to file 5' },
  --   { '¡6', function() require('harpoon.ui').nav_file(6) end, desc = 'Harpoon navigate to file 6' },
  --   { '¡7', function() require('harpoon.ui').nav_file(7) end, desc = 'Harpoon navigate to file 7' },
  --   { '¡8', function() require('harpoon.ui').nav_file(8) end, desc = 'Harpoon navigate to file 8' },
  --   { '¡9', function() require('harpoon.ui').nav_file(9) end, desc = 'Harpoon navigate to file 9' },
  -- },
  -- init = function()
  --   local map = vim.keymap.set
  --
  --   local opts = function(overrides)
  --     return vim.tbl_extend('keep', { nowait = true, silent = true, noremap = true }, overrides or {})
  --   end
  --
  --   -- https://github.com/ThePrimeagen/harpoon#-harpooning
  --   -- map('n', '¡m', function() require('harpoon.mark').add_file() end, opts({ desc = 'Harpoon mark_file' }))
  --   map('n', '¡a', function() require('harpoon.mark').add_file() end, opts({ desc = 'Harpoon mark_file' }))
  --   map('n', '¡o', function() require('harpoon.ui').toggle_quick_menu() end, opts({ desc = 'Harpoon toggle_quick_menu' }))
  --   map('n', '¡n', function() require('harpoon.ui').nav_next() end, opts({ desc = 'Harpoon nav_next' }))
  --   map('n', '¡p', function() require('harpoon.ui').nav_prev() end, opts({ desc = 'Harpoon nav_prev' }))
  --
  --   -- Switch to any mark without bringing up the menu
  --   map('n', '¡1', function() require('harpoon.ui').nav_file(1) end, opts({ desc = 'Harpoon navigate to file 1' }))
  --   map('n', '¡2', function() require('harpoon.ui').nav_file(2) end, opts({ desc = 'Harpoon navigate to file 2' }))
  --   map('n', '¡3', function() require('harpoon.ui').nav_file(3) end, opts({ desc = 'Harpoon navigate to file 3' }))
  --   map('n', '¡4', function() require('harpoon.ui').nav_file(4) end, opts({ desc = 'Harpoon navigate to file 4' }))
  --   map('n', '¡5', function() require('harpoon.ui').nav_file(5) end, opts({ desc = 'Harpoon navigate to file 5' }))
  --   map('n', '¡6', function() require('harpoon.ui').nav_file(6) end, opts({ desc = 'Harpoon navigate to file 6' }))
  --   map('n', '¡7', function() require('harpoon.ui').nav_file(7) end, opts({ desc = 'Harpoon navigate to file 7' }))
  --   map('n', '¡8', function() require('harpoon.ui').nav_file(8) end, opts({ desc = 'Harpoon navigate to file 8' }))
  --   map('n', '¡9', function() require('harpoon.ui').nav_file(9) end, opts({ desc = 'Harpoon navigate to file 9' }))
  -- end,
  config = function()
    local harpoon = require('harpoon')

    harpoon:setup()

    -- Telescope configuration
    -- local conf = require('telescope.config').values
    -- local function toggle_telescope(harpoon_files)
    --   local file_paths = {}
    --   for _, item in ipairs(harpoon_files.items) do
    --     table.insert(file_paths, item.value)
    --   end
    --
    --   local make_finder = function()
    --     local paths = {}
    --
    --     for _, item in ipairs(harpoon_files.items) do
    --       table.insert(paths, item.value)
    --     end
    --
    --     return require("telescope.finders").new_table({ results = paths })
    --   end
    --
    --   require('telescope.pickers').new({}, {
    --     prompt_title = 'Harpoon',
    --     finder = require('telescope.finders').new_table({
    --       results = file_paths,
    --     }),
    --     previewer = conf.file_previewer({}),
    --     sorter = conf.generic_sorter({}),
    --     attach_mappings = function(prompt_buffer_number, map)
    --         -- The keymap you need
    --         map('i', '<C-d>', function()
    --           local state = require("telescope.actions.state")
    --           local selected_entry = state.get_selected_entry()
    --           local current_picker = state.get_current_picker(prompt_buffer_number)
    --
    --           -- This is the line you need to remove the entry
    --           harpoon:list():remove(selected_entry)
    --           current_picker:refresh(make_finder())
    --         end)
    --
    --         return true
    --       end,
    --   }):find()
    -- end

    -- https://github.com/ThePrimeagen/harpoon/tree/harpoon2?tab=readme-ov-file#basic-setup
    vim.keymap.set("n", "¡a", function() harpoon:list():add() end)

    -- Use Telescope as a UI
    -- https://github.com/ThePrimeagen/harpoon/tree/harpoon2?tab=readme-ov-file#telescope
    -- vim.keymap.set("n", "¡o", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
    vim.keymap.set("n", "¡o", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    -- Switch to any mark without bringing up the menu
    vim.keymap.set("n", "¡1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "¡2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "¡3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "¡4", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "¡5", function() harpoon:list():select(5) end)
    vim.keymap.set("n", "¡6", function() harpoon:list():select(6) end)
    vim.keymap.set("n", "¡7", function() harpoon:list():select(7) end)
    vim.keymap.set("n", "¡8", function() harpoon:list():select(8) end)
    vim.keymap.set("n", "¡9", function() harpoon:list():select(9) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "¡p", function() harpoon:list():prev() end)
    vim.keymap.set("n", "¡n", function() harpoon:list():next() end)


    -- {
    --   global_settings = {
    --     -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    --     save_on_toggle = false,
    --
    --     -- saves the harpoon file upon every change. disabling is unrecommended.
    --     save_on_change = true,
    --
    --     -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    --     enter_on_sendcmd = false,
    --
    --     -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    --     tmux_autoclose_windows = false,
    --
    --     -- filetypes that you want to prevent from adding to the harpoon list menu.
    --     excluded_filetypes = { 'harpoon' },
    --   },
    --   menu = {
    --     width = math.floor(vim.api.nvim_win_get_width(0) * 0.6),
    --   },
    -- }
  end,
}
