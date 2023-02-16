local status, toggleterm = pcall(require, 'toggleterm')

if (not status) then return end

-- https://github.com/akinsho/toggleterm.nvim
toggleterm.setup({
  size = function(term)
    if term.direction == 'horizontal' then
      return 20
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-t>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
})
