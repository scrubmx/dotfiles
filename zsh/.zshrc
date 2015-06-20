# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom"

# Load ~/.aliases and ~/.functions
for file in ~/.{aliases,functions,githelpers}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

COMPOSER_BIN="~/.composer/vendor/bin"
MYSQL_BIN="/usr/local/mysql/bin"
NPM_PATH="/usr/local/share/npm/bin"
GIT_PATH="/usr/local/git/bin"
export PATH="$COMPOSER_BIN:$MYSQL_BIN:$NPM_PATH:$GIT_PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"


# Fix the nasty fluorescent green the directory problem.
# http://forums.fedoraforum.org/showthread.php?t=169528 user:buddha
export LS_COLORS="${LS_COLORS}tw=30;47:ow=34;47:"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(npm brew composer laravel5 git git-extras sublime z)

source $ZSH/oh-my-zsh.sh

# Tracks your most used directories, based on 'frecency'
# source https://github.com/rupa/z
if [ -f ~/z.sh ]; then
    . ~/z.sh
fi
