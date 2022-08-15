#!/bin/bash

# nvim
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim"
rm -rf "$HOME/.config/nvim/bundle"
ln -s "$HOME/dotfiles/nvim/bundle" "$HOME/.config/nvim"
rm -rf "$HOME/.config/nvim/coc-settings.json"
ln -sf "$HOME/dotfiles/nvim/coc-settings.json" "$HOME/.config/nvim"

# Xresources
rm -rf "$HOME/.config/X11"
ln -s "$HOME/dotfiles/X11" "$HOME/.config"

# i3
rm -rf "$HOME/.config/i3"
ln -s "$HOME/dotfiles/i3" "$HOME/.config"

# zsh
mkdir -p "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/.zshenv" "$HOME"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/aliases" "$HOME/.config/zsh/aliases"
rm -rf "$HOME/.config/zsh/external"
ln -sf "$HOME/dotfiles/zsh/external" "$HOME/.config/zsh"

# polybar
mkdir -p "$HOME/.config/polybar"
ln -sf "$HOME/dotfiles/polybar/config" "$HOME/.config/polybar"
ln -sf "$HOME/dotfiles/polybar/launch.sh" "$HOME/.config/polybar"

# fonts
# mkdir -p "$XDG_DATA_HOME"
# cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

# dunst
# mkdir -p "$XDG_CONFIG_HOME/dunst"
# ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

# termite
# mkdir -p "$XDG_CONFIG_HOME/termite"
# ln -sf "$DOTFILES/termite/config" "$XDG_CONFIG_HOME/termite/config"

# tmux
# mkdir -p "$XDG_CONFIG_HOME/tmux"
# ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
