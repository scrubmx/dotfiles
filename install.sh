#!/bin/sh

# Install Oh My Zsh
# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Get our custom zsh-theme
wget -O ~/.oh-my-zsh/themes/custom.zsh-theme https://raw.githubusercontent.com/scrubmx/dotfiles/master/.oh-my-zsh/themes/custom.zsh-theme

# Install Homebrew
# https://brew.sh/#install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew analytics off

brew update

brew install wget
brew install bat
brew install lsd
brew install grep
brew install ripgrep
brew install hyperfine
brew install diff-so-fancy
brew install tty-clock
brew install jq
brew install fzf
brew install neovim
brew install tmux
brew install gh

# brew install fortune
# brew install cowsay
# brew install lolcat
# brew install spotify-tui
# brew install terminal-notifier

# brew install elixir
brew install node
brew install php@8.3
brew install composer
brew install psysh
brew install nginx

brew install sqlite
# brew install mariadb
# brew install mysql@8.0
# brew install postgresql@16

brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
# yabi --start-service
# skhd --start-service

# Install fonts
# https://www.nerdfonts.com/font-downloads
brew tap homebrew/cask-fonts

# https://github.com/githubnext/monaspace
brew install font-monaspace
# https://github.com/tonsky/FiraCode
brew install font-fira-code
# https://github.com/source-foundry/Hack
brew install font-hack

# Install applications
# brew tap homebrew/cask
# brew install brew-cask

brew install --cask 1password
brew install --cask alfred
# brew install --cask brave-browser
brew install --cask karabiner-elements
brew install --cask kitty
# brew install --cask moom
brew install --cask coderunner
brew install --cask github
brew install --cask insomnia
brew install --cask json-viewer
brew install --cask qlmarkdown
brew install --cask slack
brew install --cask spotify
brew install --cask tableplus
brew install --cask transmit
brew install --cask vitamin-r
brew install --cask vlc
brew install --cask zoom
brew install --cask discord

# brew install --cask daisydisk
# brew install --cask dropbox
# brew install --cask droplr
# brew install --cask figma
# brew install --cask google-chrome
# brew install --cask httpie
# brew install --cask iterm2
# brew install --cask jumpshare
# brew install --cask mysqlworkbench
# brew install --cask nordvpn
# brew install --cask phpstorm
# brew install --cask transmission
# brew install --cask visual-studio-code

# Install software from the Mac App Store
brew install mas

# mas install 937984704 # Amphetamine
# mas install 904280696 # Things
mas install 1091189122 # Bear
# mas install 605732865 # RSS Bot

# Remove stale lock files and outdated downloads
brew cleanup

# Install global composer packages
composer global require laravel/installer
composer global require laravel/valet
composer global require friendsofphp/php-cs-fixer
composer global require squizlabs/php_codesniffer

# https://hexdocs.pm/phoenix/installation.html
# Install hex package manager and Phoenix app generator
mix local.hex
mix archive.install hex phx_new

# Install vim plugin manager https://linuxhint.com/vim-vundle-tutorial
# Have to still run :PluginInstall
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Create custom directories
mkdir ~/Code
mkdir ~/Sites

# Create desktop shortcuts
ln -s ~/ ~/Desktop/Home
ln -s ~/Code ~/Desktop/Code
