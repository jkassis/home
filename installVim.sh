# editors : nvim
brew install nvim fzf the_silver_searcher ctags
mkdir ~/.config
ln -sf ~/Home/.config/nvim ~/.config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

#pip2 install neovim

sudo ln -s /usr/local/bin/nvim /usr/local/bin/nv
