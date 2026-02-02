#!/bin/bash

set -euxo pipefail

# Install Oh My Zsh ---------------------------------------------
# https://ohmyz.sh/#install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew ----------------------------------------------
# https://brew.sh/#install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

trap 'echo "✖ Script failed at line $LINENO"; exit 1' ERR

brew analytics off
brew update

brew install bat
brew install cmatrix
brew install cowsay
brew install diff-so-fancy
brew install docker
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
brew install microsoft-teams
brew install neovim
brew install ripgrep
# brew install spotify-tui
# brew install terminal-notifier
brew install tmux
brew install tree-sitter
brew install tty-clock
brew install uv
brew install wezterm
brew install wget
brew install zoxide


# Languages & Package Managers ----------------------------------

brew install mise
brew install nvm
brew install node
brew install nginx
brew install elixir
# brew install php
# brew install psysh
# brew install composer
# brew install swift

# AI Agents -----------------------------------------------------

brew install gemini-cli
brew install --cask codex
brew install --cask copilot-cli
brew install --cask cursor
brew install --cask cursor-cli

# Databases -----------------------------------------------------

brew install sqlite
# brew install mariadb
# brew install postgresql@16
# brew services start postgresql@16

# Yabai, Skhd, and Borders --------------------------------------

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

# Install applications ------------------------------------------

brew install --cask 1password
brew install --cask alfred
brew install --cask brave-browser
brew install --cask coderunner
brew install --cask discord
brew install --cask figma
brew install --cask firefox
brew install --cask ghostty
brew install --cask github
brew install --cask insomnia
brew install --cask json-viewer
brew install --cask kaleidoscope
brew install --cask karabiner-elements
# brew install --cask kitty
brew install --cask kiro
brew install --cask livebook
# brew install --cask moom
brew install --cask qlmarkdown
brew install --cask slack
brew install --cask spotify
brew install --cask tableplus
brew install --cask transmit
brew install --cask vitamin-r
brew install --cask vlc
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

# Install from App Store  ---------------------------------------

brew install mas

mas install 1091189122 # Bear
# mas install 937984704 # Amphetamine
# mas install 904280696 # Things
# mas install 605732865 # RSS Bot

# Remove stale lock files and outdated downloads
brew cleanup

# ---------------------------------------------------------------
# Configurations & Themes 
# ---------------------------------------------------------------

# Bat Theme -----------------------------------------------------

mkdir -p "$(bat --config-dir)/themes"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
wget -O "$(bat --config-dir)" https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/bat/config
bat cache --build

# Oh My Zsh Config ----------------------------------------------

mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/{themes,plugins}
wget -O ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/custom.zsh-theme https://raw.githubusercontent.com/scrubmx/dotfiles/master/.oh-my-zsh/custom/themes/custom.zsh-theme
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Ghostty Config -----------------------------------------------

mkdir -p ~/.config/ghostty
wget -O ~/.config/tmux/tmux.conf https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/ghostty/config

# WezTerm Config ------------------------------------------------

mkdir -p ~/.config/wezterm
wget -O ~/.config/wezterm/wezterm.lua https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/wezterm/wezterm.lua

# Tmux Config --------------------------------------------------

mkdir -p ~/.config/tmux
wget -O ~/.config/tmux/tmux.conf https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/tmux/tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Window Managment ----------------------------------------------

mkdir -p ~/.config/{borders,skhd,yabai}
wget -O ~/.config/skhd/skhdrc https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/skhd/skhdrc
wget -O ~/.config/yabai/yabairc https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/yabai/yabairc
wget -O ~/.config/borders/bordersrc https://raw.githubusercontent.com/scrubmx/dotfiles/refs/heads/master/.config/borders/bordersrc

mkdir -p ~/.config/eza/themes
wget -O ~/.config/eza/themes/catppuccin.yml https://raw.githubusercontent.com/eza-community/eza-themes/refs/heads/main/themes/catppuccin.yml
ln -s ~/.config/eza/themes/catppuccin.yml ~/.config/eza/theme.yml

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

mkdir $HOME/{Code,Sites}
