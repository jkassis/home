#!/usr/bin/env bash
# Home links
mkdir "$HOME/.config"
ln -sf "$HOME/home/.bash_logout" "$HOME"
ln -sf "$HOME/home/.bash_profile" "$HOME"
ln -sf "$HOME/home/.bashrc" "$HOME"
ln -sf "$HOME/home/.config/nvim" "$HOME/.config/nvim"
ln -sf "$HOME/home/.config/terminator" "$HOME/.config/terminator"
ln -sf "$HOME/home/.gitconfig" "$HOME"
ln -sf "$HOME/home/.gitignore_global" "$HOME"
ln -sf "$HOME/home/.oh-my-zsh" "$HOME"
ln -sf "$HOME/home/.p10k.zsh" "$HOME"
ln -sf "$HOME/home/.profile" "$HOME"
ln -sf "$HOME/home/.zshrc" "$HOME"
ln -sf "$HOME/home/bin" "$HOME"

mkdir -p "$HOME/.local/bin/nv"
ln -sf $(which nvim) "$HOME/.local/bin/nv"
