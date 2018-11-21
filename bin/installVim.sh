#!/usr/bin/env bash

# binary link
ln -sf $(which nvim) /usr/local/bin/nv

# setup the config dir
mkdir "$HOME/.config"
ln -sf "$HOME/Home/.config/nvim" "$HOME/.config"

# install vim-plug and install plugins
curl -fLo "$HOME/local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

# set the env (for what?)
VIMDIR=$(dirname $(which nvim))

# install plugin providers
pip install neovim --upgrade
pip3 install neovim --upgrade
npm install -g neovim

# Add link to nv
echo "EUID is $EUID"
if [ $EUID -ne 0 ]
  then ln -s $VIMDIR/nvim $VIMDIR/nv
  else sudo ln -s $VIMDIR/nvim $VIMDIR/nv 
fi
