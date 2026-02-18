#!/usr/bin/env bash

# -e: exit immediately if any command returns non-zero
# -u: treat unset variables as an error (helps catch typos / missing env vars)
# -o pipefail: a pipeline fails if *any* command in it fails (not just the last one)
set -euo pipefail

# On any error (ERR), print the line number ($LINENO) and the command that failed ($BASH_COMMAND) to stderr
trap 'echo "✖ Failed at line $LINENO: $BASH_COMMAND" >&2' ERR

# Set the “word splitting” separators to newline + tab only (not space),
# so loops/read/splitting don’t accidentally break on spaces in filenames/paths
IFS=$'\n\t'

# Tell the Homebrew installer to run in non-interactive mode (no prompts / password prompts),
# which is safer for automation but will fail if it *needs* to ask for input
export NONINTERACTIVE=1

# Helper Functions ----------------------------------------------

log()         { printf "⮕ %s\n" "$*"; }
log_error()   { printf "\033[31m✖ %s\033[0m\n" "$*"; }
log_success() { printf "\033[32m✔ %s\033[0m\n" "$*"; }
log_warning() { printf "\033[33mℹ %s\033[0m\n" "$*"; }

ensure_xcode_clt() {
  if xcode-select -p >/dev/null 2>&1; then
    log_success "Xcode Command Line Tools already installed"
    return 0
  fi

  log "Installing Xcode Command Line Tools..."

  xcode-select --install || true
  cat <<'EOF'
  Error: Xcode Command Line Tools install was started.
  Finish the GUI install, then re-run this script.
EOF
  exit 0
}

# Start ---------------------------------------------------------

if ! [[ "$(uname -s)" == "Darwin" ]]; then
  log_error "This script is for macOS only."
  exit 1
fi

# Install Xcode Command Line Tools ------------------------------
# https://developer.apple.com/documentation/xcode/installing-the-command-line-tools

ensure_xcode_clt()

# Install Homebrew ----------------------------------------------
# https://brew.sh/#install

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
  
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
else
  log_error "Installed but 'brew' not found in expected locations."
  exit 1
fi

# Homebrew Cleanup ----------------------------------------------

brew analytics off
brew update

# ---------------------------------------------------------------
# Install Homebrew CLI Tools, Casks, and Fonts
# ---------------------------------------------------------------

brew install bat
brew install cmatrix
brew install cowsay
brew install diff-so-fancy
brew install dotenv-linter
brew install eza
brew install fastfetch
brew install fortune
brew install fzf
brew install gh
brew install grep
brew install hyperfine
brew install jq
brew install lolcat
brew install lua
brew install luajit
brew install luarocks
# brew install lsd
# brew install microsoft-teams
brew install neovim
brew install nginx
brew install ripgrep
# brew install spotify-tui
# brew install terminal-notifier
brew install tmux
brew install tree-sitter
brew install tty-clock
brew install uv
brew install wget
brew install zoxide

# Languages & Package Managers ----------------------------------

# Install Node
# brew install nvm
brew install node
# brew install pnpm
# brew install yarn

# Install PHP
# brew install php
# brew install psysh
# brew install composer

# Install Elixir
# brew install asdf
# brew install erlang
# brew install elixir

# Install Ruby
# https://guides.rubyonrails.org/install_ruby_on_rails.html
# brew install openssl@3 libyaml gmp rust
# brew install mise
# mise use -g ruby@3
# gem install rails

# AI Coding Agents ----------------------------------------------

brew install gemini-cli
brew install ollama
brew install --cask codex || true
brew install --cask codex-app || true
brew install --cask copilot-cli  || true
brew install --cask cursor || true
brew install --cask cursor-cli || true

# Databases -----------------------------------------------------

brew install sqlite
# brew install mariadb
# brew install postgresql@16
# brew services start postgresql@16

# Yabai, Skhd, and Borders --------------------------------------

brew tap koekeishiya/formulae
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

brew tap FelixKratz/formulae
brew install borders

# Install fonts -------------------------------------------------

brew tap homebrew/cask-fonts

# https://github.com/githubnext/monaspace
brew install --cask font-monaspace
# https://github.com/tonsky/FiraCode
brew install --cask font-fira-code
# https://github.com/source-foundry/Hack
brew install --cask font-hack
# https://github.com/JetBrains/JetBrainsMono
brew install --cask font-jetbrains-mono
# https://github.com/ryanoasis/nerd-fonts
brew install --cask font-symbols-only-nerd-font

# Install cask applications -------------------------------------

brew install --cask 1password
brew install --cask alfred
brew install --cask brave-browser
brew install --cask coderunner
brew install --cask discord
brew install --cask docker-desktop
brew install --cask figma
brew install --cask firefox
brew install --cask ghostty
brew install --cask github
brew install --cask insomnia
brew install --cask json-viewer
brew install --cask kaleidoscope
brew install --cask karabiner-elements
# brew install --cask kitty
# brew install --cask kiro
brew install --cask livebook
brew install --cask microsoft-teams
# brew install --cask moom
brew install --cask ngrok
brew install --cask qlmarkdown
brew install --cask slack
brew install --cask spotify
brew install --cask tableplus
brew install --cask transmit
brew install --cask vitamin-r
brew install --cask vlc
brew install --cask wezterm
brew install --cask whatsapp
brew install --cask zed
brew install --cask zoom

# brew install --cask daisydisk
# brew install --cask dropbox
# brew install --cask droplr
# brew install --cask google-chrome
# brew install --cask httpie
# brew install --cask iterm2
# brew install --cask jumpshare
# brew install --cask mysqlworkbench
# brew install --cask nordvpn
# brew install --cask phpstorm
# brew install --cask transmission
# brew install --cask visual-studio-code

# ---------------------------------------------------------------
# Install Oh My Zsh
# ---------------------------------------------------------------

# https://ohmyz.sh/#install
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# https://github.com/ohmyzsh/ohmyzsh#unattended-install
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  log_success "Oh My Zsh already installed"
else
  log "Installing Oh My Zsh..."

  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended  
fi

# Install from App Store  ---------------------------------------

brew install mas

if mas list >/dev/null 2>&1; then
  mas install 1091189122 || true # Bear
  # mas install 937984704 || true # Amphetamine
  # mas install 904280696 || true # Things
  # mas install 605732865 || true # RSS Bot
else
  log_warning "Mas not signed in. Skipping App Store installs"
fi

# Remove stale lock files and outdated downloads
brew cleanup

# ---------------------------------------------------------------
# Configurations & Themes 
# ---------------------------------------------------------------

# Bat Theme -----------------------------------------------------

mkdir -p "$(bat --config-dir)/themes"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
wget -O "$(bat --config-dir)/config" https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/bat/config
bat cache --build

# Eza Config ---------------------------------------------------

# Set `export EZA_CONFIG_DIR="$HOME/.config/eza"` on $HOME/.zshrc
mkdir -p "$HOME/.config/eza/themes"
wget -O "$HOME/.config/eza/themes/catppuccin.yml" https://raw.githubusercontent.com/eza-community/eza-themes/refs/heads/main/themes/catppuccin.yml
ln -sf "$HOME/.config/eza/themes/catppuccin.yml" "$HOME/.config/eza/theme.yml"

# Git Config ---------------------------------------------------

mkdir -p "$HOME/.config/git"
wget -O "$HOME/.config/git/config" https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/git/config
wget -O "$HOME/.config/git/ignore" https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/git/ignore
wget -O "$HOME/.config/git/template" https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/git/template

# ---------------------------------------------------------------
# Install Oh My Pluginss and Custom Theme
# ---------------------------------------------------------------

# Oh My Zsh Config ----------------------------------------------

mkdir -p "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
fi

if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
fi

mkdir -p "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes"
wget -O "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/custom.zsh-theme" \
  https://raw.githubusercontent.com/scrubmx/dotfiles/master/.oh-my-zsh/custom/themes/custom.zsh-theme

# Ghostty Config -----------------------------------------------

mkdir -p "$HOME/.config/ghostty"
wget -O "$HOME/.config/ghostty/config" https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/ghostty/config

# WezTerm Config ------------------------------------------------

mkdir -p "$HOME/.config/wezterm"
wget -O "$HOME/.config/wezterm/wezterm.lua" https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/wezterm/wezterm.lua

# Tmux Config --------------------------------------------------

mkdir -p "$HOME/.config/tmux"
wget -O "$HOME/.config/tmux/tmux.conf" https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/tmux/tmux.conf

if [[ ! -d "$HOME/.config/tmux/plugins/tpm/.git" ]]; then
  git clone --depth=1 https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi

# Window Managment ----------------------------------------------

mkdir -p "$HOME/.config/borders" "$HOME/.config/skhd" "$HOME/.config/yabai"
wget -O "$HOME/.config/skhd/skhdrc" https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/skhd/skhdrc
wget -O "$HOME/.config/yabai/yabairc" https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/yabai/yabairc
wget -O "$HOME/.config/borders/bordersrc" https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/borders/bordersrc

# To start later (permissions needed):
# yabai --start-service || true
# skhd --start-service || true
# brew services start borders || true

# PHP Setup  ----------------------------------------------------

# composer global require laravel/installer
# composer global require laravel/valet
# composer global require friendsofphp/php-cs-fixer
# composer global require squizlabs/php_codesniffer

# Elixir Setup --------------------------------------------------
# https://hexdocs.pm/phoenix/installation.html

# mix local.hex --force
# mix archive.install hex phx_new --force

# Custom directories --------------------------------------------

mkdir -p "$HOME/Code" "$HOME/Sites"

log_success "Script completed successfully"
