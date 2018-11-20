#!env bash
# Link everything
ln -sf ~/Home/.zshrc ~
ln -sf ~/Home/.gitconfig ~
ln -sf ~/Home/.gitignore_global ~
ln -sf ~/Home/.ideavimrc ~
ln -sf ~/Home/.tmux.conf ~
ln -sf ~/Home/.vim ~
ln -sf ~/Home/.zshrc ~
ln -sf ~/Home/bin ~
ln -sf $(which nvim) /usr/local/bin/nv

alias kcDashToken=~/Home/bin/kcDashToken.bash
