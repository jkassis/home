#!/usr/bin/env bash
# Home links
mkdir -p "$HOME/.config"
ln -sf "$HOME/home/.bash_logout" "$HOME"
ln -sf "$HOME/home/.bash_profile" "$HOME"
ln -sf "$HOME/home/.bashrc" "$HOME"
ln -sf "$HOME/home/.gitconfig" "$HOME"
ln -sf "$HOME/home/.gitignore_global" "$HOME"
ln -sf "$HOME/home/.oh-my-zsh" "$HOME"
ln -sf "$HOME/home/.profile" "$HOME"
ln -sf "$HOME/home/.vim" "$HOME"
ln -sf "$HOME/home/.zshrc" "$HOME"
ln -sf "$HOME/home/bin" "$HOME"
ln -sf $(which nvim) "$HOME/home/bin/nv"
