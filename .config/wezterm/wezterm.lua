-- Wez's Terminal Emulator Configuration
-- https://wezfurlong.org/wezterm/config/files.html
-- https://wezfurlong.org/wezterm/config/lua/config
local wezterm = require('wezterm')
local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = 'One Dark (Gogh)'

-- 60, 100, 165
config.max_fps = 100
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- https://monaspace.githubnext.com
config.font = wezterm.font({ family = 'Monaspace Neon' })

-- https://monaspace.githubnext.com#code-ligatures
config.harfbuzz_features = { 'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss09', 'cv30', 'cv60' }

config.font_size = 14.0
config.line_height = 1.2
config.scrollback_lines = 10000
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = false
config.macos_window_background_blur = 50
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.window_padding = {
  left = '0cell',
  right = '0cell',
  bottom = '0cell',
  top = '1.4cell',
}

config.colors = {
  foreground = '#a0a8b7',
  ansi = {
    '#181b20', -- Black
    '#e55561', -- Red
    '#8ebd6b', -- Green
    '#e2b86b', -- Yellow
    '#4fa6ed', -- Blue
    '#bf68d9', -- Purple
    '#48b0bd', -- Cyan
    '#a0a8b7', -- White
  },
}

config.background = {
  {
    source = { Color = '#111315' }, -- '#111315'
    height = '100%',
    width = '100%',
    opacity = 0.80,
    hsb = {
      saturation = 0.2,
      brightness = 0.2,
    },
  },
}

-- https://wezfurlong.org/wezterm/config/keys.html
config.keys = {
  { mods = 'CMD', key = '1', action = act.SendString(',1') }, -- Cmd+1 -> <Leader>1
  { mods = 'CMD', key = 'p', action = act.SendString('\x1b,ff') }, -- Cmd+p -> Esc <Leader>ff
  { mods = 'CMD', key = 'r', action = act.SendString('\x1b,fi') }, -- Cmd+r -> Esc <Leader>fi
  { mods = 'CMD', key = 'g', action = act.SendString('\x1b,fg') }, -- Cmd+g -> Esc <Leader>fg
  { mods = 'CMD', key = 'b', action = act.SendString('\x1b,fb') }, -- Cmd+b -> Esc <Leader>fb
  -- { mods = 'OPT', key = 'LeftArrow', action = act.SendString('\x1bb') }, -- Option+Left -> Alt+b (backward-word)
  -- { mods = 'OPT', key = 'RightArrow', action = act.SendString('\x1bf') }, -- Option+Right -> Alt+f (forward-word)
  { mods = 'OPT', key = 'LeftArrow', action = act.SendKey({ mods = 'ALT', key = 'b' }) }, -- Option+Left -> Alt+b (backward-word)
  { mods = 'OPT', key = 'RightArrow', action = act.SendKey({ mods = 'ALT', key = 'f' }) }, -- Option+Right -> Alt+f (forward-word)
}

-- config.enable_kitty_keyboard = true

return config
