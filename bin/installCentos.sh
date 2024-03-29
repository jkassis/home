$!/usr/bin/env bash

# Install developer tools
yum install -y https://centos7.iuscommunity.org/ius-release.rpm
yum install -y rsync bash zsh git ssh openssh-server openssh-clients the_silver_searcher fzf ctags less curl wget vim python-pip php-xdebug golang gcc make perl-Error coreutils autoload node npm cargo.x86_64 neovim.x86_64 python36u-pip python36u-devel

# fd
cargo install fd-find

# Fix python links
ln -s /usr/bin/python /usr/local/bin/python
ln -s /usr/bin/python3.6 /usr/local/bin/python3

cd ~

# Install everything else
~/home/bin/installZsh.sh || true
~/home/bin/installVim.sh || true
~/home/bin/installLinks.sh || true
~/home/bin/installLemonade.sh || true

