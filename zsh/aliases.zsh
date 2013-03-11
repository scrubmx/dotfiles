# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

# Show history
alias history='fc -l 1'

# List direcory contents
alias ls='ls -FHG'
alias la='ls -A'
alias ll='ls -alF'
alias l='ls -CF'
alias vi='vim'
alias svi='sudo vi'
alias sites='cd ~/sites/'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias filemerge="open -a '/Applications/Xcode.app/Contents/Applications/FileMerge.app'"
alias sublime="open -a '/Applications/Sublime Text.app'"
alias afind='ack-grep -il'
alias ipad="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"
alias iphone="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"
alias newalias="sublime ~/.oh-my-zsh/lib/aliases.zsh"
alias vhost="sublime /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf; sublime /etc/hosts"
alias find="noglob find"

# laravel artisan shortcuts
alias pagm="php artisan generate:migration"

# Server connection shortcuts
alias tangentlabs='ssh -p 443 root@208.117.43.22 -D 8080'
alias hacemoscodigo='ssh root@hacemoscodigo.com'
alias sshcodigo='ssh root@hacemoscodigo.com'
