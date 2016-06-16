ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"

ZSH_THEME_RVM_PROMPT_PREFIX="[rvm:"
ZSH_THEME_RVM_PROMPT_SUFFIX="]$reset_color"

ZSH_THEME_PHP_PROMPT_PREFIX="["
ZSH_THEME_PHP_PROMPT_SUFFIX="]$reset_color"

# Display the git prompt info
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " $(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Display actual ruby version & gemset in prompt
function rvm_prompt_info() {
  if [ -f Gemfile ] || [ -f ../Gemfile ] || [ -f ../../Gemfile ] || [ -f ../../../Gemfile ]; then
    echo " $fg[magenta]$ZSH_THEME_RVM_PROMPT_PREFIX$(rvm-prompt)$ZSH_THEME_RVM_PROMPT_SUFFIX"
  fi
}

function php_version() {
  echo `php -r "phpinfo();" | grep "PHP Version" -m 1 | sed -e "s/PHP Version => /php-/g"`
}

function php_prompt_info() {
  if [ -f composer.json ] || [ -f ../composer.json ] || [ -f ../../composer.json ] || [ -f ../../../composer.json ]; then
    echo " $fg[blue]$ZSH_THEME_PHP_PROMPT_PREFIX$(php_version)$ZSH_THEME_PHP_PROMPT_SUFFIX"
  fi
}

function date_prompt_info() {
  echo " $fg[grey][$(date +"%d/%m/%Y "%H:%M"")]$reset_color"
}

# Display the current working directory
function get_pwd() {
  print -D $PWD
}

# Build the entire prompt info
function precmd() {
  echo -e
  print -rP "$fg[cyan]$USER $fg[grey]on $fg[cyan]laptop $fg[grey]at $fg[yellow]$(get_pwd)$(git_prompt_info)$(php_prompt_info)$(rvm_prompt_info)$(date_prompt_info) "
}

PROMPT='%{$reset_color%}→ '
