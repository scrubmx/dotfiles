-- Git integration for buffers
-- https://github.com/lewis6991/gitsigns.nvim
--
-- Config options:
-- https://github.com/lewis6991/gitsigns.nvim/blob/main/doc/gitsigns.txt
return {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
  config = function()
    vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' })
    vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })
    vim.api.nvim_set_hl(0, 'GitSignsAddN', { link = 'GitSignsAddN' })

    vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitSignsChange' })
    vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })
    vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })

    vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitSignsChange' })
    vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })
    vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })

    vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitSignsDelete' })
    vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })
    vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })

    vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitSignsDelete' })
    vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })
    vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })

    vim.api.nvim_set_hl(0, 'GitSignsUntracked', { link = 'GitSignsUntracked' })
    vim.api.nvim_set_hl(0, 'GitSignsUntrackedLn', { link = 'GitSignsUntrackedLn' })
    vim.api.nvim_set_hl(0, 'GitSignsUntrackedNr', { link = 'GitSignsUntrackedNr' })

    require('gitsigns').setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▎" },
        untracked = { text = "▎" },
        topdelete = { text = "契" },
        changedelete = { text = "▎" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '<author>, <author_time:%R>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    })
  end,
}
