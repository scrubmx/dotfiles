# If you come from bash you might have to change your $PATH.
# COMPOSER_PATH="./vendor/bin:$(composer global config bin-dir --absolute 2>/dev/null)"
COMPOSER_PATH="./vendor/bin:$HOME/.composer/vendor/bin"
LARAVEL_SPARK_PATH="$HOME/Code/PHP/laravel/spark-installer"
OPENSSL_PATH="/usr/local/opt/openssl@1.1/bin"

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

export PATH="/usr/local/sbin:$PATH:$COMPOSER_PATH:$LARAVEL_SPARK_PATH:$OPENSSL_PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/scrub/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="custom"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=15

# Load ~/.aliases and ~/.functions
for file in ~/.{aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Tracks your most used directories, based on 'frecency'
# source https://github.com/rupa/z
if [ -f "$HOME/Applications/Rupa/z.sh" ]; then
    source "$HOME/Applications/Rupa/z.sh"
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions mix)

source "$ZSH/oh-my-zsh.sh"

# User configuration
export ERL_AFLAGS="-kernel shell_history enabled"
export PYTHONSTARTUP="$HOME/.pythonrc"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=000"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

export EDITOR='vim'
