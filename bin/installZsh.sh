#!/bin/bash

# make directories
mkdir ~/.zsh
touch ~/.zshrc.local

# install autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"



chsh -s /bin/zsh
