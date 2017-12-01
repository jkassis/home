#!/bin/bash

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/versions

# browsers
brew cask install google-chrome
brew cask install firefoxdeveloperedition

# desktop productivity
#brew cask install alfred
# TODO: alfred/spotlight - can we automate setting the hotkeys?

# window management
brew cask install spectacle

# monitor management
brew cask install duet

# dock setting
# "Set Dock to auto-hide and remove the auto-hiding delay? (y/n)"
#defaults write com.apple.dock autohide-delay -float 0
#defaults write com.apple.dock autohide-time-modifier -float 0

# special key access
# "Disabling press-and-hold for special keys in favor of key repeat"
#defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# TODO: look into https://gist.github.com/brandonb927/3195465 and related for more tweaks

# markup redlining
brew cask install skitch
brew cask install licecap

# music and media
brew cask install spotify
brew cask install vlc

# passwords
brew cask install 1password
brew cask install keeper
# TODO: can we automate 1password setup/config?

# communication
brew cask install slack
# TODO: slack - auto add my specific servers?

# languages : java
brew cask install java8

# language : javascript
brew install node

# languages: python
brew install python
pip2 install virtualenv virtualenvwrapper flake8

# languages: go
brew install go --cross-compile-common
mkdir -p ~/Code/go

# editors : atom
brew cask install atom
apm install python-debugger language-python
brew cask install sublime-text3

# virtual machine managers
brew cask install virtualbox

# TODO: atom package setup...
# ex-mode
# linter
# linter-eslint
# set-syntax
# language-javascript-jsx
# vim-mode-plus

# editors : emacs
brew cask install emacs

# editors : vim
brew install neovim
# symlinks
ln -sf `pwd`/init.vim ~/.config/nvim/init.vim
ln -sf `pwd`/init.vim ~/.vimrc

# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# python language support
pip2 install neovim
vim +PlugInstall +qall
# TODO: symlink nvimrc to vimrc
# TODO: run nvim :PlugInstall (and vim)

# ides
xcode-select --install
sudo xcodebuild -license accept # agree to xcode license

# hosting : heroku
brew install heroku-toolbelt

# hosting : docker
brew cask install docker

# file transfer
brew install httpie
brew cask install dropbox
# TODO: dropbox - can we get my specific version?

# terminal
brew cask install iterm2
curl "https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Dark.itermcolors" > ~/Downloads/OneDark.itermcolors

# zsh
brew install zsh
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# symlink zshrc
ln -sf `pwd`/.zshrc ~/.zshrc

# symlink zsh theme
ln -sf `pwd`/zsh/dbprompt.zsh-theme ~/.oh-my-zsh/themes/dbprompt.zsh-theme
# symlink zsh aliases
mkdir ~/zsh
ln -sf `pwd`/zsh/aliases.zsh ~/zsh/aliases.zsh
ln -sf `pwd`/zsh/completions ~/.oh-my-zsh/completions

# shell : directory environments
brew install direnv

# search
brew install the_silver_searcher
brew install elasticsearch@5.6
brew services start elasticsearch@5.6

# databases
brew install neo4j
#brew install postgresql
brew cask install postgres
brew cask install pgadmin4
brew services start postgresql

# git setup
git config --global user.email "jeremy@betterworks.com"
git config --global user.name "Jeremy Kassis"
git config --global core.editor nvim
# TODO: automate ssh key registration with github? - can be a python script

# sourcetree
brew cask install sourcetree

# font setup
brew tap caskroom/fonts
brew cask install font-fira-code

# disable guest account
defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO

echo "Post installation tips:"
echo "- Set fira-code font in iterm2"
echo "- Set itermcolor scheme (file is OneDark.itermcolors)"
