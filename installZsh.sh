#!/bin/bash

# make directories
mkdir ~/.oh-my-zsh
mkdir ~/.zsh
touch ~/.zshrc.local

# install autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
