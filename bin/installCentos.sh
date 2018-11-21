$!/usr/bin/env bash

# Install developer tools
yum install -y rsync bash zsh git ssh openssh-server openssh-clients the_silver_searcher python python3 fzf ctags python34-neovim less curl wget vim python-pip python34-pip php-xdebug golang gcc make perl-Error coreutils autoload node npm cargo.x86_64

# fd
cargo install fd-find

# Fix python links
ln -s /usr/bin/python /usr/local/bin/python
ln -s /usr/bin/python3 /usr/local/bin/python3

cd ~

# Install everything else
Home/bin/installZsh.sh || true
Home/bin/installVim.sh || true
Home/bin/installLinks.sh || true
Home/bin/installLemonade.sh || true

