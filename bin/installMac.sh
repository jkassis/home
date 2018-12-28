#!/usr/bin/env bash

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
brew cask install lastpass
# TODO: can we automate 1password setup/config?

# communication
brew cask install slack
# TODO: slack - auto add my specific servers?

# virtual machine managers
brew cask install virtualbox

# languages : java
brew cask install java8

## language : javascript
#brew install node
#npm install -g jasmine-core
#npm install -g karma karma-jasmine karma-coverage karma-webpack karma-sourcemap-loader karma-chrome-launcher

## languages: python
brew install python@2
pip2 install virtualenv virtualenvwrapper flake8

## languages: go
#brew install go --cross-compile-common
#mkdir -p "$HOME/Code/go"

## build system
#npm install -g webpack

# editors : atom
brew cask install atom
# TODO: atom package setup...
# ex-mode
# linter
# linter-eslint
# set-syntax
# language-javascript-jsx
# vim-mode-plus

# editors : sublime
brew cask install sublime-text3

# editors : emacs
brew cask install emacs

# vim
brew install python python3 nvim fzf the_silver_searcher ctags fd
./installVim.sh

# oni
brew cask install oni
defaults write com.extropy.oni ApplePressAndHoldEnabled -bool false

# ides
xcode-select --install
sudo xcodebuild -license accept # agree to xcode license

# vs code
brew cask install visual-studio-code
rm ~/Library/Application\ Support/Code/User/settings.json
ln ~/home/.vs.code.settings ~/Library/Application\ Support/Code/User/settings.json

# hosting : heroku
brew install heroku-toolbelt

# hosting : docker
brew cask install docker

# file transfer
brew install httpie
brew cask install dropbox

# terminal
brew cask install iterm2
# curl "https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Dark.itermcolors" > ~/Downloads/OneDark.itermcolors

# shell : zsh and oh-my-zsh
brew install zsh

# shell : directory environments
brew install direnv

# search
brew install the_silver_searcher
brew install elasticsearch@5.6
brew services start elasticsearch@5.6

# databases
# brew install neo4j
# brew install postgresql
# brew cask install postgres
# brew cask install pgadmin4
# brew services start postgresql

# git setup

# sourcetree
brew cask install sourcetree

# beyond compare
brew cask install beyond-compare

# font setup
brew tap caskroom/fonts
brew cask install font-fira-code font-hack-nerd-font

# disable guest account
defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO

echo "Post installation tips:"
echo "- Set fira-code font in iterm2"
echo "- Set itermcolor scheme (file is OneDark.itermcolors)"

