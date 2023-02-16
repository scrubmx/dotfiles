local status, onedark = pcall(require, 'onedark')

if (not status) then return end

onedark.setup {
  style = "darker",
  ending_tildes = true,
  diagnostics = {
    darker = false,
    background = false,
  },
  colors = {
    bg0 = "#111111",
  },
}

onedark.load()
