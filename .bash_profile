alias ls='ls -FHG'
alias la='ls -A'
alias ll='ls -alF'
alias l='ls -CF'
alias vi='vim'
alias svi='sudo vi'
alias sub='sublime'
alias status='st'
alias sites='cd ~/sites/'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias sshcodigo='ssh root@hacemoscodigo.com'
alias tangentlabs='ssh -p 443 root@208.117.43.22 -D 8080'
alias filemerge="open -a '/Applications/Xcode.app/Contents/Applications/FileMerge.app'"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#source /usr/local/git/contrib/completion/git-completion.bash
if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
fi


GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_SHOWDIRTYSTATE=true

export PATH="$HOME/.rbenv/bin:$PATH"
export PS1='\[\e[0;36m\]scrub@\u \[\e[0;37m\]on\[\e[0;33m\] \w\[\e[0m\]\[\033[0;31m\]$(__git_ps1 " (%s)")\[\033[0;37m\]\n→ '
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
