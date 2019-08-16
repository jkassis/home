#!/usr/bin/env bash
# Home links
mkdir -p "$HOME/.config"
ln -sf "$HOME/home/.config/fish" "$HOME/.config"
ln -sf "$HOME/home/.zshrc" "$HOME"
ln -sf "$HOME/home/.gitconfig" "$HOME"
ln -sf "$HOME/home/.gitignore_global" "$HOME"
ln -sf "$HOME/home/.ideavimrc" "$HOME"
ln -sf "$HOME/home/.tmux.conf" "$HOME"
ln -sf "$HOME/home/.tmux" "$HOME"
ln -sf "$HOME/home/.vim" "$HOME"
ln -sf "$HOME/home/.zshrc" "$HOME"
ln -sf "$HOME/home/bin" "$HOME"

