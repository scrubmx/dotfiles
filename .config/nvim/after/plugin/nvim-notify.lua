local status, notify = pcall(require, 'notify')

if (not status) then return end

notify.setup({
  stages = 'fade',
  on_open = nil,
  on_close = nil,
  render = 'default',
  timeout = 5000,
  max_width = nil,
  max_height = nil,
  background_colour = 'Normal',
  minimum_width = 50,
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})

vim.notify = notify
