#!env bash

# setup the config dir
mkdir ~/.config
ln -sf ~/Home/.config/nvim ~/.config

# install vim-plug and install plugins
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

# set the env (for what?)
VIMDIR=$(dirname $(which nvim))

# install plugin providers
pip install neovim --upgrade
pip3 install neovim --upgrade
npm install -g neovim

# Add link to nv
if [ "$EUID" -ne 0 ]
  then ln -s $VIMDIR/nvim $VIMDIR/nv
  else sudo ln -s $VIMDIR/nvim $VIMDIR/nv 
fi
