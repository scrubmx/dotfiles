# ------------------------------------------------------------------------------
#  File Navigation
# ------------------------------------------------------------------------------

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

# List files in pretty format and colors
# https://github.com/lsd-rs/lsd
alias ls='lsd -lh'
alias la='lsd -lhA'
alias ll='lsd -lhA'

# List files in pretty format and colors
# alias ls='ls -FGH'
# alias la='ls -AG'
# alias ll='ls -AlGh'

# Human readable disk-free output
alias free='df -h'

# Start basic calculator REPL
alias calc='bc -l'

# Shortcuts
alias dk="cd ~/Desktop"
alias sites="cd ~/Sites"
alias config="cd ~/.config"

alias vi='nvim'
alias vim='nvim'

# alias history='fc -l 1'
alias history="fc -ln 0 | fzf --prompt 'search> ' --color header:bold --header 'Press ⏎ to copy into clipboard' | tr -d '\n' | pbcopy"

# https://www.cyberciti.biz/howto/neofetch-awesome-system-info-bash-script-for-linux-unix-macos
alias about="neofetch --config none --bold off --colors 6 6 8 8 8 7 --ascii $HOME/.config/neofetch/ascii-apple-custom.txt --ascii_colors 6 2 3 1 5 4"

# Toggle wrap settings
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
# alias clear!="clear && printf '\e[3J'"

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

# Display a clock in the terminal
#
# https://github.com/xorg62/tty-clock#readme
# https://formulae.brew.sh/formula/tty-clock
# alias clock="tty-clock -c -n -D -C 6 -d 60"
alias clock="tty-clock -c -n -D -C 6"
alias clockdate="tty-clock -c -n -C 6"

# Create new aliases
alias newalias="nvim ~/.aliases.zsh"
alias newfunction="nvim ~/.functions.zsh"
alias zshconf="nvim ~/.zshrc"
alias gitconf="nvim ~/.gitconfig"
alias sshconf="nvim ~/.ssh/config"
alias vimconf="nvim ~/.config/nvim/init.lua"
alias vimconf="cd ~/.config/nvim && nvim init.lua"
alias yabaiconf="cd ~/.config/yabai && nvim yabairc"

# Pretty print the $PATH values
alias path='echo $PATH | tr -s ":" "\n"'

# Open Applications
alias chrome="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias brave="open -a /Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser"
alias emacs='open -a /Applications/Emacs.app/Contents/MacOS/Emacs'
alias gist="open https://gist.github.com/scrubmx"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Open Firefox and browse to hulu.com, also open a socks5 proxy.
alias hulu="open -a '/Applications/Firefox.app' http://hulu.com & ssh tangentlabs -D 8080"


# ------------------------------------------------------------------------------
#  Web Development
# ------------------------------------------------------------------------------

# Download the Selenium standalone server from:
# http://docs.seleniumhq.org/download/
alias selenium='java -jar /usr/local/share/selenium/standalone-server.jar'

# Reset the index and working tree and remove untracked files from the working tree
alias nah="git reset --hard; git clean -df"


# ------------------------------------------------------------------------------
#  PHP Specific
# ------------------------------------------------------------------------------

# Composer dump-autoload
alias dal="composer dump-autoload"

# Run PHPUnit test suite
alias t="clear! && ./vendor/bin/phpunit --order-by=defects --stop-on-failure --stop-on-error"
alias tp="clear! && php artisan test --parallel"
alias tpr="clear! && php artisan test --parallel --recreate-databases"

# Laravel artisan shortcuts
alias artisan="php artisan"
alias tinker="php artisan tinker"
alias migrate="php artisan migrate"

# PHP CS Fixer
alias phpfix="php-cs-fixer fix --rules=@PSR2,binary_operator_spaces,no_unused_imports,phpdoc_trim,trailing_comma_in_multiline_array"

# Run "tail -f ./storage/logs/laravel.log" with color output
alias logs="tail -f ./storage/logs/laravel.log | awk '\
    {matched=0}\
    /INFO:/           {matched=1; print \"\\033[0;34m\" \$0 \"\\033[0m\"}\
    /NOTICE:/         {matched=1; print \"\\033[0;37m\" \$0 \"\\033[0m\"}\
    /DEBUG:/          {matched=1; print \"\\033[0;36m\" \$0 \"\\033[0m\"}\
    /WARNING:/        {matched=1; print \"\\033[0;33m\" \$0 \"\\033[0m\"}\
    /ERROR:/          {matched=1; print \"\\033[0;31m\" \$0 \"\\033[0m\"}\
    /ALERT:/          {matched=1; print \"\\033[0;35m\" \$0 \"\\033[0m\"}\
    /\[stacktrace\]/  {matched=1; print \"\\033[0;35m\" \$0 \"\\033[0m\"}\
    matched==0        {print \"\\033[0;37m\" \$0 \"\\033[0m\"}'"

# ------------------------------------------------------------------------------
#  Elixir
# ------------------------------------------------------------------------------

alias mixs="iex -S mix phoenix.server"
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

# Add Paulina's voice to Mac OS X
#  - Navigate to: System Preferences > Dictation & Speech > Text to Speech
#  - Select the System Voice menu and choose "Customize" in the drop-down
#  - Choose the voice: Spanish (Mexico) > Paulina
alias say="say --voice=Paulina"

# Flush DNS cache
alias flushdns="sudo killall -HUP mDNSResponder"

# Copy public SSH key to clipboard
alias sshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied id_rsa.pub to clipboard.'"
alias copykey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied id_rsa.pub to clipboard.'"
alias copyssh="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied id_rsa.pub to clipboard.'"

# Show/hide full path on finder title bar
alias showpath="defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES; killall Finder"
alias hidepath="defaults write com.apple.finder _FXShowPosixPathInTitle -bool NO; killall Finder"

# Show hidden files in Finder
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Hide/show Desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Delete all .DS_Store files recursively
alias deleteDS="find . -name '*.DS_Store' -type f -ls -delete"
alias removeDS="find . -name '*.DS_Store' -type f -ls -delete"
