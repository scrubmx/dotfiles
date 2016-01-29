ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"

ZSH_THEME_RVM_PROMPT_PREFIX="[rvm:"
ZSH_THEME_RVM_PROMPT_SUFFIX="]$reset_color"

# Display the git prompt info
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Build the string containing the ruby version & gemset
function prompt_rvm() {
    rbv=`rvm-prompt`
    rbv=${rbv#ruby-}
    [[ $rbv == *"@"* ]] || rbv="${rbv}@default"
    echo $rbv
}

# Display actual ruby version & gemset in prompt
function rvm_prompt_info() {
  if [ -f Gemfile ] || [ -f ../Gemfile ] || [ -f ../../Gemfile ] || [ -f ../../../Gemfile ]; then
    echo "$fg[magenta]$ZSH_THEME_RVM_PROMPT_PREFIX$(prompt_rvm)$ZSH_THEME_RVM_PROMPT_SUFFIX"
  fi
}

# Display the current working directory
function get_pwd() {
  print -D $PWD
}

# Build the entire prompt info
function precmd() {
  echo -e
  print -rP "$fg[cyan]$USER $fg[grey]on $fg[cyan]laptop $fg[grey]at $fg[yellow]$(get_pwd) $(git_prompt_info) $(rvm_prompt_info) "
}

PROMPT='%{$reset_color%}→ '
