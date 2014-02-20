function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX $(parse_git_dirty) $(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function get_pwd() {
  print -D $PWD
}


function precmd() {
print -rP '
$fg[cyan]scrub $fg[grey]at $fg[cyan]laptop $fg[grey]on $fg[yellow]$(get_pwd) $(git_prompt_info) %{$fg_bold[magenta]%}↻ %*% '
}

PROMPT='%{$reset_color%}➞ '

ZSH_THEME_GIT_PROMPT_PREFIX="$fg[grey]⭠$fg[red]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]✘"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]✔"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}➦"
