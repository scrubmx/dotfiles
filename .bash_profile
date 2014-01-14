# Load ~/.aliases and ~/.functions
for file in ~/.{aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#source /usr/local/git/contrib/completion/git-completion.bash
if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
fi

# Tracks your most used directories, based on 'frecency'
# source https://github.com/rupa/z
if [ -f ~/z.sh ]; then
    . ~/z.sh
fi

GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_SHOWDIRTYSTATE=true

export PATH="$HOME/.rbenv/bin:$PATH"
export PS1='\[\e[0;36m\]scrub@\u \[\e[0;37m\]on\[\e[0;33m\] \w\[\e[0m\]\[\033[0;31m\]$(__git_ps1 " (%s)")\[\033[0;37m\]\n→ '
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
