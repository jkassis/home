#!/usr/bin/env bash
# Home links
mkdir -p "$HOME/.config"
ln -sf "$HOME/home/.zshrc" "$HOME"
ln -sf "$HOME/home/.gitconfig" "$HOME"
ln -sf "$HOME/home/.gitignore_global" "$HOME"
ln -sf "$HOME/home/.tmux.conf" "$HOME"
ln -sf "$HOME/home/.tmux" "$HOME"
ln -sf "$HOME/home/bin" "$HOME"
ln -sf "$HOME/home/.bashrc" "$HOME"
ln -sf "$HOME/home/.bash_profile" "$HOME"
ln -sf "$HOME/home/.bash_logout" "$HOME"
ln -sf $(which nvim) "$HOME/nv"
