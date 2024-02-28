# Show colors as tiles
function tilecolors() {
    echo '  \n\n\n'
    echo '\t        \033[30m█\033[30m█\033[30m█\033[30m█\033[30m█\033[0m     \033[31m█\033[31m█\033[31m█\033[31m█\033[31m█\033[0m     \033[32m█\033[32m█\033[32m█\033[32m█\033[32m█\033[0m     \033[33m█\033[33m█\033[33m█\033[33m█\033[33m█\033[0m     \033[34m█\033[34m█\033[34m█\033[34m█\033[34m█\033[0m     \033[35m█\033[35m█\033[35m█\033[35m█\033[35m█\033[0m     \033[36m█\033[36m█\033[36m█\033[36m█\033[36m█\033[0m     \033[37m█\033[37m█\033[37m█\033[37m█\033[37m█\033[0m'
    echo '\t        \033[30m█\033[30m█\033[30m█\033[30m█\033[30m█\033[30;1m█\033[0m    \033[31m█\033[31m█\033[31m█\033[31m█\033[31m█\033[31;1m█\033[0m    \033[32m█\033[32m█\033[32m█\033[32m█\033[32m█\033[32;1m█\033[0m    \033[33m█\033[33m█\033[33m█\033[33m█\033[33m█\033[33;1m█\033[0m    \033[34m█\033[34m█\033[34m█\033[34m█\033[34m█\033[34;1m█\033[0m    \033[35m█\033[35m█\033[35m█\033[35m█\033[35m█\033[35;1m█\033[0m    \033[36m█\033[36m█\033[36m█\033[36m█\033[36m█\033[36;1m█\033[0m    \033[37m█\033[37m█\033[37m█\033[37m█\033[37m█\033[37;1m█\033[0m'
    echo '\t        \033[30m█\033[30m█\033[30m█\033[30m█\033[30m█\033[30;1m█\033[0m    \033[31m█\033[31m█\033[31m█\033[31m█\033[31m█\033[31;1m█\033[0m    \033[32m█\033[32m█\033[32m█\033[32m█\033[32m█\033[32;1m█\033[0m    \033[33m█\033[33m█\033[33m█\033[33m█\033[33m█\033[33;1m█\033[0m    \033[34m█\033[34m█\033[34m█\033[34m█\033[34m█\033[34;1m█\033[0m    \033[35m█\033[35m█\033[35m█\033[35m█\033[35m█\033[35;1m█\033[0m    \033[36m█\033[36m█\033[36m█\033[36m█\033[36m█\033[36;1m█\033[0m    \033[37m█\033[37m█\033[37m█\033[37m█\033[37m█\033[37;1m█\033[0m'
    echo '\t         \033[30;1m█\033[30;1m█\033[30;1m█\033[30;1m█\033[30;1m█\033[0m     \033[31;1m█\033[31;1m█\033[31;1m█\033[31;1m█\033[31;1m█\033[0m     \033[32;1m█\033[32;1m█\033[32;1m█\033[32;1m█\033[32;1m█\033[0m     \033[33;1m█\033[33;1m█\033[33;1m█\033[33;1m█\033[33;1m█\033[0m     \033[34;1m█\033[34;1m█\033[34;1m█\033[34;1m█\033[34;1m█\033[0m     \033[35;1m█\033[35;1m█\033[35;1m█\033[35;1m█\033[35;1m█\033[0m     \033[36;1m█\033[36;1m█\033[36;1m█\033[36;1m█\033[36;1m█\033[0m     \033[37;1m█\033[37;1m█\033[37;1m█\033[37;1m█\033[37;1m█\033[0m'
    echo '  \n\n\n'
}

# Show the current font variants: normal, bold, italic, underline, and strikethrough
function testfont() {
  echo -e "normal\n\e[1mbold\e[0m\n\e[3mitalic\e[0m\n\e[4munderline\e[0m\n\e[9mstrikethrough\e[0m"
}

# List all terminal colors
function clicolors() {
    local i=1
    local c

    for color in {000..255}; do;
        c=$c"$FG[$color]$color✔$reset_color  ";
        if [ `expr $i % 8` -eq 0 ]; then
            c=$c"\n"
        fi
        i=`expr $i + 1`
    done;
    echo $c | sed 's/%//g' | sed 's/{//g' | sed 's/}//g' | sed '$s/..$//';
    c=''
}

# Require a package from a local directory
function composer_local() {
    if [ $# -eq 0 ]; then
       echo "usage: composer_local ~/package/directory"
    else
        composer config repositories.local '{ "type": "path", "url": "'$1'" }' --file composer.json
    fi
}

# Disable line wrapping for output in the Terminal
# https://apple.stackexchange.com/questions/90392/disable-line-wrapping-for-output-in-the-terminal#answer-210666
function _nowrap() {
    tput rmam;
}

# Disable line wrapping for output in the Terminal
function _wrap() {
    tput smam;
}

# https://github.com/arnaud-lb/vim-php-namespace
function maketags() {
    ctags -R --PHP-kinds=cfi --regex-php="/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i" --exclude=.git --exclude=node_modules --exclude=vendor --exclude=storage --exclude=bootstrap --exclude=public
    ctags -R --PHP-kinds=cfi --regex-php="/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i" --exclude=vendor/_laravel_idea --exclude=vendor/psy --exclude=vendor/vlucas --exclude=vendor/brianium -f tags.vendors vendor > /dev/null 2>&1
}

# Generate a random password with a default lenght of 32 characters
function password() {
    openssl rand -base64 ${1:-32}
}

# Start a PHP server from a directory, optionally specifying the port (Requires PHP >= 5.4)
function phpserver() {
    local port="${1:-4000}";
    sleep 1 && open "http://localhost:${port}/" & php -S "localhost:${port}";
}

# Filter processes with keyword
function showps() {
    ps -A | grep -v 'grep' | grep -i "$@"
}

# Set a timer for the given number of minutes
# "&" will send the process to the background
function timer() {
    _backround_timer $(( $1 * 60 )) &
}

# Set a timer for the given number of seconds
function _backround_timer() {
    for i in {1..$1}
    do
        sleep 1
    done

    # afplay /System/Library/Sounds/Glass.aiff
    # afplay /System/Library/Sounds/Morse.aiff
    afplay /System/Library/Sounds/Purr.aiff
    osascript -e 'display notification "Get up, stretch, walk make some tea..." with title "The timer is up"'
}

# Shorthand for `tree` with hidden files and ignoring common vendors
# The output gets piped into less
function tre() {
    tree -aC -I '.git|vendor|node_modules|bower_components' --dirsfirst "$@" | less -FRX;
}

# Get colors on manual pages
function man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m")    \
    LESS_TERMCAP_md=$(printf "\e[1;31m")    \
    LESS_TERMCAP_me=$(printf "\e[0m")       \
    LESS_TERMCAP_se=$(printf "\e[0m")       \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m")       \
    LESS_TERMCAP_us=$(printf "\e[1;32m")    \
    man "$@"
}

# Extract archives based on the extension
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvjf $1   ;;
            *.tar.gz)  tar xvzf $1   ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar x $1    ;;
            *.gz)      gunzip $1     ;;
            *.tar)     tar xvf $1    ;;
            *.tbz2)    tar xvjf $1   ;;
            *.tgz)     tar xvzf $1   ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *.7z)      7z x $1       ;;
            *)         echo "don't know how to extract '$1'..." ;;
        esac
    else
       echo "'$1' is not a valid file!"
    fi
}

# Open the current git repository in the browser
function github() {
    if [ ! -d .git ]; then
        echo "ERROR: This isn't a git directory" && exit 1;
    fi

    local option="${1:-NA}"
    local remote=$(git config --get remote.origin.url)
    local github_url github_path help_text

    read -r -d '' help_text<<EOF
github opens the current git repository in the browser.

Usage:
  github [options]

Options:
  -b, --branch        open repository on the current branch
  -c, --commit        open repository current commit
  -d, --diff          open a diff with two commits or refs [default: "develop", "main"]
  -h, --help          show help text for this command
  -p, --pulls         open the pull requests page
  -r, --pull-request  open a pull request for the current branch [default: "develop"]
  -s, --settings      open settings page for the project
  -w, --wiki          open wiki page for the project
EOF

    if [[ $remote != *github* ]]; then
        echo "ERROR: Remote origin is invalid" && exit 1;
    fi

    github_url="${remote%.git}" # remove ".git" suffix

    # Convert "git@github.com:" to https://github.com
    if [[ $github_url =~ git@github.com:* ]]; then
        github_url="https://github.com/${github_url#*:}"
    fi

    case "$option" in
        '-b' | '--branch' ) github_path="/tree/$(git rev-parse --abbrev-ref HEAD)" ;;
        '-c' | '--commit' ) github_path="/tree/$(git rev-parse HEAD)" ;;
        '-d' | '--diff' ) github_path="/compare/${2:-develop}...${3:-main}" ;;
        '-h' | '--help' ) echo $help_text && return ;;
        '-p' | '--pulls' ) github_path="/pulls" ;;
        '-r' | '--pull-request' ) github_path="/compare/${2:-develop}...$(git rev-parse --abbrev-ref HEAD)" ;;
        '-s' | '--settings' ) github_path="/settings" ;;
        '-w' | '--wiki' ) github_path="/wiki" ;;
        '-h' | '--help' | 'NA' | * ) github_path="" ;;
    esac

    open "$github_url$github_path"
}

# Bluetooth restart
function btrestart() {
    sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
    sudo kextload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
}

function phpv() {
    brew unlink php@7.4 php@8.1
    brew link —force —overwrite $1
    brew services start $1
    composer global update
    valet use --force $1
}

alias php74="phpv php@7.4"
alias php81="phpv php@8.1"

# Manage Python virtual environment
function venv() {
    local option="${1:-NA}"
    local help_text

    read -r -d '' help_text<<EOF
venv manages your python3 venv environment.

Usage:
  venv [options]

Options:
  -a, --activate      activate virtual environment
  -c, --create        create a virtual environment [default: "venv"]
  -d, --deactivate    deactivate virtual environment
  -h, --help          text
EOF

    case "$option" in
        '-a' | '--activate' ) . venv/bin/activate ;;
        '-c' | '--create' ) python3 -m venv "${2:-venv}" ;;
        '-d' | '--deactivate' ) deactivate ;;
        '-h' | '--help' | 'NA' | * ) echo $help_text && return ;;
    esac
}

function slack() {
    local slack_shortcuts

    read -r -d '' slack_shortcuts<<EOF
Slack keyboard shortcuts

Help Center:
https://slack.com/help/articles/201374536-Slack-keyboard-shortcuts

Action                                Shortcut
  Compose a new message                 ⌘ N
  Unsend a message                      ⌘ Z
  Set your status                       ⌘ Shift Y
  Show or hide the left sidebar	        ⌘ Shift D
  Show or hide the right sidebar        ⌘ .
  Open your preferences                 ⌘ ,
  Create a new snippet                  ⌘ Shift Enter
  Start a search                        ⌘ G
  Search in the current conversation    ⌘ F
  Start, join, leave, or end a huddle   ⌘ Shift H
  Toggle mute on a huddle               ⌘ Shift Space
EOF

    echo $slack_shortcuts
}

function phpstorm() {
    local phpstorm_keybindings

    read -r -d '' phpstorm_keybindings<<EOF
Action                      Shortcut
  Show intention actions       ⌥ ⏎
  Toggle structure pane        ⌘ 7
  Toggle git pane              ⌘ 9
  Open navigation bar          ⌘ ↑
  Search everywhere            ⇧ ⇧
  Close the most recent pane   ⌘ ⇧ W
  Go to recent files           ⌘ E
  Go to recent locations       ⌘ ⇧ E
  Toggle terminal panel        ^ ⇧ T
  Run test class/method        ^ ⇧ R
  Run last test class/method   ^ R
EOF

    echo $phpstorm_keybindings
}
