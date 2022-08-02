ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"

ZSH_THEME_RVM_PROMPT_PREFIX="[rvm:"
ZSH_THEME_RVM_PROMPT_SUFFIX="]$reset_color"

ZSH_THEME_PHP_PROMPT_PREFIX="[php:"
ZSH_THEME_PHP_PROMPT_SUFFIX="]$reset_color"

# Display the git prompt info
function _git_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " $FG[239]$(parse_git_dirty) $(git_current_branch)$reset_color"
}

# Display ruby version & gemset info
function _ruby_info() {
  if [ -f Gemfile ] || [ -f ../Gemfile ] || [ -f ../../Gemfile ]; then
    echo " $fg[magenta]$ZSH_THEME_RVM_PROMPT_PREFIX$(rvm-prompt)$ZSH_THEME_RVM_PROMPT_SUFFIX"
  fi
}

# Display php version & xdebug info
function _php_info() {
  if [ -f composer.json ] || [ -f ../composer.json ] || [ -f ../../composer.json ]; then
    echo " $fg[blue]$ZSH_THEME_PHP_PROMPT_PREFIX$(php -r 'echo phpversion();')$ZSH_THEME_PHP_PROMPT_SUFFIX$(_xdebug_info)"
  fi
}

# Display xdebug info if extension is loaded
function _xdebug_info() {
  local fn_xdebug_loaded="echo extension_loaded('xdebug');"
  local fn_xdebug_mode="echo join(',', xdebug_info('mode'));"

  if [[ "$(php -r $fn_xdebug_loaded)" == 1 ]]; then
    local xdebug_mode="$(php -r $fn_xdebug_mode)"

    if [ ! -z "$xdebug_mode" ]; then
      echo " $fg[magenta][xdebug:$xdebug_mode]$reset_color"
    fi
  fi
}

# Build the entire prompt info
function precmd() {
  echo -e
  print -rP "$fg[cyan]$USER $FG[239]on $fg[cyan]macbook $FG[239]at $fg[yellow]%~% $(_git_info)$(_php_info)$(_ruby_info) "
}

PROMPT="%{$reset_color%}👉 "

# Display the time on the right
# RPROMPT="%{$FG[239]%}%D{%a %d %b %R}%{$reset_color%}"

# Useful characters & emojis
# 👉 🐥 👍 🤙 🚀
# 〇 Ideographic number zero
# 〉 Right-pointing angle bracket
# ⟩  Mathematical right angle bracket
# →  Arrow pointing right
#   Git branch 1
# שׂ  Git branch 2
