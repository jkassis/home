# editors : nvim
mkdir ~/.config
ln -sf ~/Home/.config/nvim ~/.config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
sudo ln -s /usr/local/bin/nvim /usr/local/bin/nv
pip2 install neovim --upgrade
pip3 install neovim --upgrade

