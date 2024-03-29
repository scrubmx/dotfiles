local status, neotree = pcall(require, 'neo-tree')

if (not status) then return end

vim.g['neo_tree_remove_legacy_commands'] = 1

vim.fn.sign_define('DiagnosticSignError', { text = "", texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = "", texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = "", texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = "", texthl = 'DiagnosticSignHint' })

-- https://github.com/nvim-neo-tree/neo-tree.nvim#quickstart
neotree.setup({
  close_if_last_window = true,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = false,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 0,
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '└',
      highlight = 'NeoTreeIndentMarker',
      with_expanders = false,
      expander_collapsed = '',
      expander_expanded = '',
      expander_highlight = 'NeoTreeExpander',
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
      default = "",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
    },
    git_status = {
      symbols = {
        added = "",
        deleted = "",
        modified = "",
        renamed = "➜",
        untracked = "★",
        ignored = "◌",
        unstaged = "✗",
        staged = "✓",
        conflict = "",
      },
    },
  },
  window = {
    position = 'left',
    width = 40,
    mappings = {
      ['<2-LeftMouse>'] = 'open',
      ['<CR>'] = 'open',
      ['o'] = 'open',
      ['S'] = 'open_split',
      ['s'] = 'open_vsplit',
      ['C'] = 'close_node',
      ['<bs>'] = 'navigate_up',
      ['.'] = 'set_root',
      ['H'] = 'toggle_hidden',
      ['R'] = 'refresh',
      ['/'] = 'fuzzy_finder',
      ['f'] = 'filter_on_submit',
      ['<C-x>'] = 'clear_filter',
      ['a'] = 'add',
      ['d'] = 'delete',
      ['r'] = 'rename',
      ['y'] = 'copy_to_clipboard',
      ['x'] = 'cut_to_clipboard',
      ['p'] = 'paste_from_clipboard',
      ['c'] = 'copy',
      ['m'] = 'move',
      ['q'] = 'close_window',
    },
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_by_name = {
        '.DS_Store',
        'thumbs.db',
        'node_modules',
        'vendor',
        '__pycache__',
      },
    },
    follow_current_file = true,
    hijack_netrw_behavior = 'open_current',
    use_libuv_file_watcher = true,
  },
  buffers = {
    show_unloaded = true,
    window = {
      mappings = {
        ['bd'] = 'buffer_delete',
      },
    },
  },
  git_status = {
    window = {
      position = 'float',
      mappings = {
        ['A'] = 'git_add_all',
        ['gu'] = 'git_unstage_file',
        ['ga'] = 'git_add_file',
        ['gr'] = 'git_revert_file',
        ['gc'] = 'git_commit',
        ['gp'] = 'git_push',
        ['gg'] = 'git_commit_and_push',
      },
    },
  },
  event_handlers = {
    {
      event = 'vim_buffer_enter',
      handler = function(_)
        if vim.bo.filetype == 'neo-tree' then
          vim.wo.signcolumn = 'auto'
        end
      end,
    },
  },
})

vim.keymap.set('n', '<Leader>1', '<Cmd>NeoTreeRevealToggle<CR>', { noremap = true })
