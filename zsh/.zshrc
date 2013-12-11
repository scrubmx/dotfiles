# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'


# Super user
alias _='sudo'
alias please='sudo'
alias fucking='sudo'

# Show history
alias history='fc -l 1'

# List direcory contents
alias ls='ls -FHG'
alias la='ls -A'
alias ll='ls -alF'
alias l='ls -CF'
alias vi='vim'
alias svi='sudo vi'
alias sites='cd /var/www/'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias newalias='vim ~/.zshrc'
alias sublime='subl'

# Server connection shortcuts
alias tangentlabs='ssh -p 443 root@208.117.43.22 -D 8080'
alias hacemoscodigo='ssh root@hacemoscodigo.com'
alias sshcodigo='ssh root@hacemoscodigo.com'


alias gh="open -a google\ chrome 'http://github.com/scrubmx'"
alias bl="open -a google\ chrome 'http://browserling.com'"

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras composer laravel)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="~/.local/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# http://forums.fedoraforum.org/showthread.php?t=169528 user:buddha
export LS_COLORS="${LS_COLORS}tw=30;47:ow=34;47:"

export TERM="xterm-256color"


function mkd(){
	mkdir -p "$@" && eval cd "\"\$$#\"";
}


# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi
