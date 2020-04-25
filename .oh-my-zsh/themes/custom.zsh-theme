
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"

ZSH_THEME_RVM_PROMPT_PREFIX="[rvm:"
ZSH_THEME_RVM_PROMPT_SUFFIX="]$reset_color"

ZSH_THEME_PHP_PROMPT_PREFIX="["
ZSH_THEME_PHP_PROMPT_SUFFIX="]$reset_color"

# Display the git prompt info
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " $fg[grey]$(parse_git_dirty) $(git_current_branch)$reset_color"
}

# Display actual ruby version & gemset in prompt
function rvm_prompt_info() {
  if [ -f Gemfile ] || [ -f ../Gemfile ] || [ -f ../../Gemfile ] || [ -f ../../../Gemfile ]; then
    echo " $fg[magenta]$ZSH_THEME_RVM_PROMPT_PREFIX$(rvm-prompt)$ZSH_THEME_RVM_PROMPT_SUFFIX"
  fi
}

function php_version() {
  echo "php-$(php -r 'echo phpversion();')"
}

function php_prompt_info() {
  if [ -f composer.json ] || [ -f ../composer.json ] || [ -f ../../composer.json ] || [ -f ../../../composer.json ]; then
    echo " $fg[blue]$ZSH_THEME_PHP_PROMPT_PREFIX$(php_version)$ZSH_THEME_PHP_PROMPT_SUFFIX"
  fi
}

# Display the current working directory
function get_pwd() {
  print -D $PWD
}

# Build the entire prompt info
function precmd() {
  echo -e
  print -rP "$fg[cyan]$USER $fg[grey]on $fg[cyan]macbook $fg[grey]at $fg[yellow]$(get_pwd)$(git_prompt_info)$(php_prompt_info)$(rvm_prompt_info) "
}

# 👉 📌 📍 🐥 👍 🚀 🚩 ▶ ➜  〇
# → 232A 〉  right-pointing angle bracket
# → 27E9 ⟩  mathematical right angle bracket
#PROMPT='%{$reset_color%}→ '
PROMPT='%{$reset_color%}👉 '
