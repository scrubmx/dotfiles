return {
  'rcarriga/nvim-notify',
  init = function()
    vim.notify = require('notify')
  end,
  opts = {
    stages = 'fade',
    on_open = nil,
    on_close = nil,
    render = 'default',
    timeout = 5000,
    max_width = nil,
    max_height = nil,
    -- background_colour = 'Normal',
    background_colour = '#080808',
    minimum_width = 50,
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  },
}
