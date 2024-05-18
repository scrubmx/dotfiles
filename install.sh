#!/bin/sh

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew analytics off
brew update

brew install fortune
brew install cowsay
brew install lolcat
brew install lsd
brew install bat
brew install fzf
brew install grep
brew install hyperfine
brew install jq
brew install wget
brew install terminal-notifier
brew install tty-clock
brew install tmux
brew install tree
brew install httpie
brew install diff-so-fancy
brew install git
brew install neofetch
brew install neovim
brew install nginx
brew install ripgrep
brew install spotify-tui
brew install sqlite
brew install node
brew install yabai
brew install yarn
brew install php@8.3
brew install mariadb
brew install postgresql@16
brew install composer
brew install elixir

# Install fonts
brew tap caskroom/fonts
brew cask install font-hack

# Install timer https://github.com/caarlos0/timer
brew tap caarlos0/homebrew-tap
brew install timer

# Install applications
# brew tap homebrew/cask
# brew install brew-cask

brew install --cask 1password
brew install --cask alfred
brew install --cask brave-browser
brew install --cask coderunner
brew install --cask daisydisk
brew install --cask discord
brew install --cask dropbox
brew install --cask droplr
brew install --cask figma
brew install --cask github
# brew install --cask google-chrome
brew install --cask insomnia
brew install --cask iterm2
brew install --cask jumpshare
brew install --cask karabiner-elementsq
brew install --cask moom
brew install --cask mysqlworkbench
brew install --cask nordvpn
brew install --cask phpstorm
brew install --cask qlmarkdown
brew install --cask slack
brew install --cask spotify
brew install --cask tableplus
brew install --cask transmission
brew install --cask transmit
brew install --cask vitamin-r
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask zoom

# Install software from the Mac App Store
brew install mas

mas install 937984704 # Amphetamine
mas install 904280696 # Things
mas install 1091189122 # Bear
mas install 605732865 # RSS Bot

# Remove stale lock files and outdated downloads
brew cleanup

# Install oh-my-zsh
# https://github.com/ohmyzsh/ohmyzsh#basic-installation
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Get our custom theme
wget -O ~/.oh-my-zsh/themes/custom.zsh-theme https://raw.githubusercontent.com/scrubmx/dotfiles/master/.oh-my-zsh/themes/custom.zsh-theme

# Install global composer packages
composer global require laravel/installer
composer global require laravel/valet
composer global require psy/psysh
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
