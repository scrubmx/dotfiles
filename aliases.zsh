# ------------------------------------------------------------------------------
#  File Navigation
# ------------------------------------------------------------------------------

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Shortcuts
alias code="cd ~/Code"
alias sites="cd ~/Sites"
alias dl="cd ~/Downloads"
alias dk="cd ~/Desktop"
alias dr="cd ~/Dropbox"

# List files pretty format and colors
alias ls='ls -FGH'
alias la='ls -AG'
alias ll='ls -AlG'
alias l='ls -CFG'
alias history='fc -l 1'

# List only directories
alias lsd='ls -l | grep "^d"'

# Like cat but with colors (requires pygments)
# pygments style: https://github.com/MozMorris/tomorrow-pygments
alias check="pygmentize -O style=tomorrownight -f console256 -g"

# Preview a file using QuickLook
alias ql="qlmanage -p 2>/dev/null"

# File size
alias fs="stat -f \"%z bytes\""


# ------------------------------------------------------------------------------
#  Miscellaneous
# ------------------------------------------------------------------------------

# Super user
alias _='sudo'
alias please='sudo'
alias fucking='sudo'

# Refresh dotfiles for the current shell
alias refresh="source ~/.zshrc"

# Super clear
alias clear!="clear; clear; clear; clear"

# https://github.com/busyloop/lolcat
# A journey of a thousand miles must begin with a single step.
# -- Lao Tsu
#  ^__^
#  (oo)\_______
#  (__)\
#
alias lolcow="fortune | cowsay | lolcat"

# https://github.com/chubin/wttr.in
#               Overcast
#      .--.     20 – 21 °C
#   .-(    ).   ← 12 km/h
#  (___.__)__)  10 km
#               0.1 mm
alias weather="curl -4 http://wttr.in/Mexico_City"

# brew install ctags
# http://www.gmarik.info/blog/2010/ctags-on-OSX/
alias ctags="`brew --prefix`/bin/ctags"

# Create new aliases
alias newalias="subl ~/.aliases"
alias newfunction="subl ~/.functions"
alias zshconfig="subl ~/.zshrc"
alias zshconf="subl ~/.zshrc"
alias gitconfig="subl ~/.gitconfig"
alias gitconf="subl ~/.gitconfig"
alias sshconf="subl ~/.ssh/config"
alias sshedit="subl ~/.ssh/config"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Open Applications
alias vi='vim'
alias svi='sudo vim'
alias ssubl="sudo subl"
alias sublime="subl"
alias chrome="open -a '/Applications/Google Chrome.app'"
alias storm="open -a '/Applications/PhpStorm.app'"
alias rmine="open -a '/Applications/RubyMine.app'"
alias xcode="open -a '/Applications/Xcode.app'"
alias calendar="open -a '/Applications/Calendar.app'"
alias spotify="open -a '/Applications/Spotify.app'"
alias reddit="open -a '/Applications/Google Chrome.app' http://www.reddit.com/"
alias github="open -a '/Applications/Google Chrome.app' https://github.com/$(whoami)"
alias gist="open -a '/Applications/Google Chrome.app' https://gist.github.com/$(whoami)"
alias trello="open -a '/Applications/Google Chrome.app' https://trello.com"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Start calculator with math support
alias bc='bc -l'

# Reboot / Halt / Shutdown
alias reboot='sudo /sbin/reboot'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# CPU and Memory
alias cpu='top -o cpu'
alias mem='top -o rsize' # memory

# Displays changes in a repository or a selected set of commits. 
alias gitk="/usr/local/git/bin/gitk"
alias gitx="/Applications/GitX.app/Contents/Resources/gitx"

# Open Firefox and browse to hulu.com, also open a socks5 proxy.
# alias hulu="open -a '/Applications/Firefox.app' http://hulu.com & ssh user@server.com -D 8080"


# ------------------------------------------------------------------------------
#  Web Development
# ------------------------------------------------------------------------------

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

# Start/Stop Local MySQL Server
alias startmysql="sudo /usr/local/mysql/support-files/mysql.server start"
alias mysqlstart="sudo /usr/local/mysql/support-files/mysql.server start"

# Create new virtual host
alias vhost="subl /private/etc/apache2/extra/httpd-vhosts.conf; subl /etc/hosts"
alias vm='function __homestead() { (cd ~/.composer/vendor/laravel/homestead && vagrant $*); unset -f __homestead; }; __homestead'

# Download selenium standalone server from:
# http://docs.seleniumhq.org/download/
alias selenium='java -jar /usr/local/bin/selenium-server-standalone.jar'


# ------------------------------------------------------------------------------
#  PHP Specific
# ------------------------------------------------------------------------------

# Create server in the current directory
alias phpserve="php -S localhost:5000"

# Composer dump autoload
alias dal="sudo composer dump-autoload"

# Laravel artisan shortcuts
alias pa="php artisan"
alias m:controller="php artisan make:controller"
alias m:job="php artisan make:job"
alias m:migration="php artisan make:migration"
alias m:model="php artisan make:model"
alias m:request="php artisan make:request"
alias m:seeder="php artisan make:seeder"
alias m:test="php artisan make:test"

# Testing
alias tb="vendor/bin/behat"
alias tu="vendor/bin/phpunit"
alias ts="vendor/bin/phpspec run"
alias tc="vendor/bin/codecept run"

# Useful for laravel projects
alias t="clear!; phpunit --stop-on-failure --stop-on-error"

# ------------------------------------------------------------------------------
#  Ruby on Rails
# ------------------------------------------------------------------------------

# Rails shortcuts
alias rg='rails g'
alias rc='rails c'
alias rd='rails dbconsole'

# Testing with RSpec
alias rt="rspec spec -f d"


# ------------------------------------------------------------------------------
#  JavaScript
# ------------------------------------------------------------------------------

alias ks="karma start karma.conf.js"


# ------------------------------------------------------------------------------
#  OS X Specific aliases
# ------------------------------------------------------------------------------

# Add Paulina voice to Mac OS X
#   - Navigate to: System Preferences > Dictation & Speech > Text to Speech
#   - Select the System Voice menu and choose "Customize" in the drop-down
#   - Choose the voice: Spanish (Mexico) > Paulina
alias say="say --voice=Paulina"

# Copy shy key to clipboard
alias sshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard.'"
alias copyssh="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard.'"

# Show/hide full path on finder titlebar
alias showpath="defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES; killall Finder"
alias hidepath="defaults write com.apple.finder _FXShowPosixPathInTitle -bool NO; killall Finder"

# Show hidden Files in finder
alias showHidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hideHidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Hide/show desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Delete all .DS_Store files recursively
alias deleteDS="find . -name '*.DS_Store' -type f -ls -delete"
alias removeDS="find . -name '*.DS_Store' -type f -ls -delete"
