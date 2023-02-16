local copilot_ok, copilot = pcall(require, 'copilot')

if not copilot_ok then return end

copilot.setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

local copilot_cmp_ok, copilot_cmp = pcall(require, 'copilot_cmp')

if not copilot_cmp_ok then return end

copilot_cmp.setup({
  formatters = {
    insert_text = require('copilot_cmp.format').remove_existing,
  },
})
