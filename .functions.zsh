# Bluetooth restart
function btrestart() {
    sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
    sudo kextload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
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

# Create new directory and cd into it
function mkd() {
    if [ $# -eq 0 ]; then
        echo "usage: mkd directory [directory [directory [...]]]"
    else
        mkdir -p "$@" && cd "$_";
    fi
}

# Generate random password with default lenght of 32 characters
function password () {
    openssl rand -base64 ${1:-32}
}

# Start a PHP server from a directory, optionally specifying the port (Requires PHP >= 5.4)
function phpserver() {
    local port="${1:-4000}";
    sleep 1 && open "http://localhost:${port}/" & php -S "localhost:${port}";
}

# Switch PHP versions
# https://freek.dev/1185-easily-switch-php-versions-in-laravel-valet
function phpv() {
    brew unlink php@7.4 php@8.1
    brew link —force —overwrite $1
    brew services start $1
    composer global update
    valet use --force $1
}
alias php74="phpv php@7.4"
alias php81="phpv php@8.1"

# Filter processes with keyword
function showps() {
    ps -A | grep -v 'grep' | grep -i "$@"
}

# Set a timer for the given number if minutes
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

# Shorthand for tree with hidden files and ignoring common vendors
# The output gets piped into less
function tre() {
    tree -aC -I '.git|vendor|node_modules|bower_components' --dirsfirst "$@" | less -FRX;
}

# Get colors in manual pages
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
        echo "ERROR: This isnt a git directory" && exit 1;
    fi

    local option="${1:-NA}"
    local remote=$(git config --get remote.origin.url)
    local github_url github_help

    read -r -d '' github_help<<EOF
github opens the current git repository in the browser.

Usage:
  github [options]

Options:
  -b, --branch        open repository on the current branch
  -c, --commit        open repository current commit
  -d, --diff          open a diff with two commits or refs [default: "develop", "master"]
  -p, --pulls         open the pull requests page
  -s, --settings      open settings page for the project
  -w, --wiki          open wiki page for the project
EOF

    if [[ $remote != *github* ]]; then
        echo "ERROR: Remote origin is invalid" && exit 1;
    fi

    github_url="${remote%.git}" # remove ".git" suffix

    if [[ $github_url =~ git@github.com:* ]]; then
        # remove "git@github.com:" prefix
        github_url="https://github.com/${github_url#*:}"
    fi

    case "$option" in
        '-b' | '--branch' ) option="/tree/$(git rev-parse --abbrev-ref HEAD)" ;;
        '-c' | '--commit' ) option="/tree/$(git rev-parse HEAD)" ;;
        '-d' | '--diff' ) option="/compare/${2:-develop}...${3:-master}" ;;
        '-h' | '--help' ) echo $github_help && return ;;
        '-p' | '--pulls' ) option="/pulls" ;;
        '-s' | '--settings' ) option="/settings" ;;
        '-w' | '--wiki' ) option="/wiki" ;;
        'NA' | *) option="" ;;
    esac

    open "$github_url$option"
}

# Manage Python virtual environment
function venv() {
    local option="${1:-NA}"
    read -r -d '' help_text<<EOF
venv manages your python3 venv environment.

Usage:
  venv [options]

Options:
  -a, --activate      activate virtual environment
  -c, --create        create virtual environment [default: "venv"]
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