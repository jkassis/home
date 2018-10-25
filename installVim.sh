# editors : nvim
mkdir ~/.config
ln -sf ~/Home/.config/nvim ~/.config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
sudo ln -s $(which nvim) $(which nvim)/../nv 
pip2 install neovim --upgrade
pip3 install neovim --upgrade

