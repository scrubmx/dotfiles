ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"
# 256 Color Support
# https://plumbum.readthedocs.io/en/latest/colors.html#color-support

# Display elixir version & mix info
local function _elixir_info() {
  if [ -f mix.exs ]; then
    # echo " $FG[239]via $fg[magenta] $(elixir --version | awk '/Elixir/ {print $2}') $FG[239]with $fg[red]  $(elixir --version | awk '/Erlang\/OTP/ {print $2}' | head -n 1)$reset_color"
    echo " $FG[239]via $fg[magenta] $(elixir --short-version)$reset_color"
  fi
}

# Display the git prompt info
local function _git_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  # echo " $FG[239]$(parse_git_dirty) $(git_current_branch)$reset_color"
  echo " $FG[239]$(parse_git_dirty) $(git_current_branch)$reset_color"
}

# Display node version & npm info
local function _node_info() {
  if [ -f next.config.js ] || [ -f babel.config.js ]; then
    echo " $FG[239]via $fg[green]󰎙 $(node --version)$reset_color"
  fi
}

# Display php version & xdebug info
local function _php_info() {
  if [ -f composer.json ]; then
    echo " $FG[239]via $fg[blue] $(php -r 'echo phpversion();')$reset_color$(_xdebug_info)"
  fi
}

# local function _python_info() {
#   if [ -f requirements.txt ];  then
#     echo " $FG[239]via $fg[blue]󰌠 $(python3 --version | sed -e 's/^Python //')$reset_color"
#   fi
# }

# Display ruby version & gemset info
local function _ruby_info() {
  if [ -f Gemfile ]; then
    echo " $FG[239]rvm $fg[red]󰴭 $(rvm-prompt | sed -e 's/^ruby-//')$reset_color"
  fi
}

# Display xdebug info if the extension is loaded
local function _xdebug_info() {
  local fn_xdebug_loaded="echo extension_loaded('xdebug');"
  local fn_xdebug_mode="echo join(',', xdebug_info('mode'));"

  if [[ "$(php -r $fn_xdebug_loaded)" == 1 ]]; then
    local xdebug_mode="$(php -r $fn_xdebug_mode)"

    if [ ! -z "$xdebug_mode" ]; then
      echo " $FG[239]xdebug $fg[green] $xdebug_mode$reset_color"
    fi
  fi
}

# Build the entire prompt info
function precmd() {
  echo -e
  # print -rP "$fg[cyan]%n $FG[239]on $fg[cyan]macbook $FG[239]at $fg[yellow]%~ $(_git_info)$(_elixir_info)$(_php_info)$(_python_info)$(_ruby_info)$(_node_info) "
  # print -rP "$fg[cyan]%n $FG[239]on $fg[cyan]macbook $FG[239]at $fg[yellow]%~$(_git_info)$(_elixir_info)$(_php_info) "
  print -rP "$fg[cyan]%n $FG[239]on $fg[cyan]macbook $FG[239]at $fg[yellow]%~$(_git_info)$(_php_info)$(_elixir_info)$(_node_info)$(_ruby_info)"
}

PROMPT="$FG[250]⟩ %{$reset_color%}"

# Display the time on the right
# RPROMPT="%{$FG[239]%}%D{%a %d %b %R}%{$reset_color%}"

# Useful characters & emojis
# 👉 🐥 👍 🤙 🚀
#   Chevron right
# ⟩  Chevron right light
# ❭  Chevron right small
# 〇 Ideographic number zero
# 〉 Right-pointing angle bracket
# ⟩  Mathematical right angle bracket
# →  Arrow pointing right
#   Git branch 1
# שׂ  Git branch 2
