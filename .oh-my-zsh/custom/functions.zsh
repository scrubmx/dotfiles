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

# Print the first 16 numbers from the Fibonacci sequence
function fibonacci() {
    echo "0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, ..."
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

function dismiss_notifications() {
  osascript -e '
  tell application "System Events"
    tell process "NotificationCenter"
      if not (window "Notification Center" exists) then return

      set alertGroups to groups of first UI element of first scroll area of first group of window "Notification Center"

      repeat with aGroup in alertGroups
        try
          perform (first action of aGroup whose name contains "Close" or name contains "Clear")
        on error errMsg
          log errMsg
        end try
      end repeat

      -- Show no message on success
      return ""
    end tell
  end tell'
}

# Print recommended git commit prefixes
# https://gitmoji.dev
# https://www.conventionalcommits.org
function git_prefixes() {
  local -a prefixes=(
    "feat|✨ Features"
    "fix|🐛 Bug Fixes"
    "chore|🧹 Chores"
    "refactor|♻️ Refactors"
    "test|✅ Tests"
    "style|🎨 Styles"
    "wip|🚧 Work in Progress"
    "docs|📝 Documentation"
  )

  local entry type section

  printf '\nRecommended git commit prefixes:\n\n'
  for entry in "${prefixes[@]}"; do
    type="${entry%%|*}"
    section="${entry#*|}"
    printf '  %-10s %s\n' "${type}:" "${section}"
  done

  printf '\nHidden / less commonly surfaced:\n\n'
  printf '  %-10s %s\n' "ci:" "👷 CI/CD related"
  printf '  %-10s %s\n' "perf:" "⚡️ Performance improvements"
  printf '  %-10s %s\n' "build:" "📦 Build and release related"
  printf '  %-10s %s\n' "revert:" "⏪ Revert a previous commit"
  printf '\n'
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
# function extract () {
#     if [ -f $1 ] ; then
#         case $1 in
#             *.tar.bz2) tar xvjf $1   ;;
#             *.tar.gz)  tar xvzf $1   ;;
#             *.bz2)     bunzip2 $1    ;;
#             *.rar)     unrar x $1    ;;
#             *.gz)      gunzip $1     ;;
#             *.tar)     tar xvf $1    ;;
#             *.tbz2)    tar xvjf $1   ;;
#             *.tgz)     tar xvzf $1   ;;
#             *.zip)     unzip $1      ;;
#             *.Z)       uncompress $1 ;;
#             *.7z)      7z x $1       ;;
#             *)         echo "don't know how to extract '$1'..." ;;
#         esac
#     else
#        echo "'$1' is not a valid file!"
#     fi
# }

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
