# ------------------------------------------------------------------------------
#  File Navigation
# ------------------------------------------------------------------------------

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Shortcuts
alias sites="cd ~/Sites"
alias dk="cd ~/Desktop"

# List files pretty format and colors
# alias ls='ls -FGH'
alias la='ls -AG'
alias ll='ls -AlGh'
alias history='fc -l 1'

# Wrap settings
# https://apple.stackexchange.com/questions/90392/disable-line-wrapping-for-output-in-the-terminal#answer-210666
alias wrap="tput smam"
alias nowrap="tput rmam"


# ------------------------------------------------------------------------------
#  Miscellaneous
# ------------------------------------------------------------------------------

# Make aliases sudo-able
alias sudo="sudo "

# Refresh dotfiles for the current shell
alias refresh="source ~/.zshrc"
alias reload="source ~/.zshrc"

# Clear terminal and reset the scrollback
# https://til.hashrocket.com/posts/g1ola6c5ku-how-to-clear-a-mac-terminal-and-its-scroll-back
alias clear!="clear && printf '\e[3J'"

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
# alias weather="curl -4 http://wttr.in/Mexico_City"
alias weather="curl -4 http://wttr.in/Mexico_City"

# Create new aliases
alias newalias="code ~/.aliases.zsh"
alias newfunction="code ~/.functions.zsh"
alias zshconf="code ~/.zshrc"
alias gitconf="code ~/.gitconfig"
alias sshconf="code ~/.ssh/config"
alias vimconf="code ~/.vimrc"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Open Applications
alias chrome="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias brave="open -a /Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser"
alias gist="open https://gist.github.com/scrubmx"
alias pulls="open https://github.com/kickfurther/kickfurther/pulls"
alias jira="open https://kickfurther.atlassian.net/jira/software/projects/KC/boards/1"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Open Firefox and browse to hulu.com, also open a socks5 proxy.
alias hulu="open -a '/Applications/Firefox.app' http://hulu.com & ssh -p 443 root@162.249.126.18 -D 8080"


# ------------------------------------------------------------------------------
#  Web Development
# ------------------------------------------------------------------------------

# Download selenium standalone server from:
# http://docs.seleniumhq.org/download/
alias selenium='java -jar /usr/local/share/selenium/standalone-server.jar'

# Reset the index and working tree and removes untracked files from the working tree
alias nah="git reset --hard; git clean -df"


# ------------------------------------------------------------------------------
#  PHP Specific
# ------------------------------------------------------------------------------

# Composer dump autoload
alias dal="composer dump-autoload"

# Run phpunit test suite
alias t="clear! & ./vendor/bin/phpunit --order-by=defects --stop-on-failure --stop-on-error"
alias tp="clear! & php artisan test --parallel"
alias tpr="clear! & php artisan test --parallel --recreate-databases"

# Laravel artisan shortcuts
alias artisan="php artisan"
alias tinker="php artisan tinker"
alias migrate="php artisan migrate"

# PHP CS Fixer
alias phpfix="php-cs-fixer fix --rules=@PSR2,binary_operator_spaces,no_unused_imports,phpdoc_trim,trailing_comma_in_multiline_array"

# Run "tail -f ./storage/logs/laravel.log" with color output
alias logs="tail -f ./storage/logs/laravel.log | awk '\
    {matched=0}\
    /INFO:/        {matched=1; print \"\\033[0;37m\" \$0 \"\\033[0m\"}\
    /WARNING:/     {matched=1; print \"\\033[0;34m\" \$0 \"\\033[0m\"}\
    /ERROR:/       {matched=1; print \"\\033[0;31m\" \$0 \"\\033[0m\"}\
    /Next/         {matched=1; print \"\\033[0;31m\" \$0 \"\\033[0m\"}\
    /ALERT:/       {matched=1; print \"\\033[0;35m\" \$0 \"\\033[0m\"}\
    /Stack trace:/ {matched=1; print \"\\033[0;35m\" \$0 \"\\033[0m\"}\
    matched==0     {print \"\\033[0;33m\" \$0 \"\\033[0m\"}'"


# ------------------------------------------------------------------------------
#  Elixir
# ------------------------------------------------------------------------------

alias mixer="iex -S mix phoenix.server" # like tinker from laravel
alias itest="iex -S mix test --trace" # run tests and stop on IEx.pry
alias prytest="iex -S mix test --trace" # run tests and stop on IEx.pry
alias pry='fc -e - mix\ test=iex\ -S\ mix\ test\ --trace mix\ test'

# Fix 'FATAL ERROR lock file "postmaster.pid" already exists'
# https://stackoverflow.com/questions/36436120/fatal-error-lock-file-postmaster-pid-already-exists#answer-48146535
alias unfuckpg="rm /usr/local/var/postgres/postmaster.pid"


# ------------------------------------------------------------------------------
#  Ruby
# ------------------------------------------------------------------------------

alias minitest="ruby -r minitest/color"
alias rc="rails console"
alias rs="rails server"


# ------------------------------------------------------------------------------
#  JavaScript
# ------------------------------------------------------------------------------

# Create a node specific .gitignore
alias gitignorenode="\curl https://www.gitignore.io/api/node >> .gitignore"

# Karma start
alias ks="karma start karma.conf.js"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

# Fix: Node Sass does not yet support your current environment: OS X
# https://github.com/sass/node-sass/issues/1764#issuecomment-262439819
alias fixsass="npm rebuild node-sass"


# ------------------------------------------------------------------------------
#  OS X Specific aliases
# ------------------------------------------------------------------------------

# Add Paulina voice to Mac OS X
#  - Navigate to: System Preferences > Dictation & Speech > Text to Speech
#  - Select the System Voice menu and choose "Customize" in the drop-down
#  - Choose the voice: Spanish (Mexico) > Paulina
alias say="say --voice=Paulina"

# Flush DNS cache
alias fushdns="sudo killall -HUP mDNSResponder"

# Copy shy key to clipboard
alias sshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard.'"
alias copykey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard.'"
alias copyssh="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard.'"

# Show/hide full path on finder titlebar
alias showpath="defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES; killall Finder"
alias hidepath="defaults write com.apple.finder _FXShowPosixPathInTitle -bool NO; killall Finder"

# Show hidden Files in finder
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Hide/show desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Delete all .DS_Store files recursively
alias deleteDS="find . -name '*.DS_Store' -type f -ls -delete"
alias removeDS="find . -name '*.DS_Store' -type f -ls -delete"
