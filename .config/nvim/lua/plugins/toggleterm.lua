return {
  'akinsho/toggleterm.nvim',
  version = '*',
  lazy = true,
  keys = [[<C-t>]],
  config = function()
    require('toggleterm').setup({
      size = function(term)
        if term.direction == 'horizontal' then
          local lines = vim.o.lines

          if (lines < 50) then
            return lines * 0.40
          else
            return lines * 0.25
          end
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.40
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
  end
}
