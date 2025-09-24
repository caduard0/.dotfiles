#!/bin/zsh
# Make simlink to files
# ln -s ~/.dotfiles/{dot_file} ~/{dot_file_path}

# Files
ln -fs ~/.dotfiles/.zshrc ~/.zshrc
ln -fs ~/.dotfiles/.gitconfig ~/.gitconfig

# Directories
mkdir -p ~/.config/hypr
ln -fs ~/.dotfiles/hypr/* ~/.config/hypr/
mkdir -p ~/.config/kitty
ln -fs ~/.dotfiles/kitty/* ~/.config/kitty/
mkdir -p ~/.config/waybar
ln -fs ~/.dotfiles/waybar/* ~/.config/waybar/
mkdir -p ~/.config/gtk-3.0
ln -fs ~/.dotfiles/gtk-3.0/* ~/.config/gtk-3.0/
mkdir -p ~/.config/gtk-4.0
ln -fs ~/.dotfiles/gtk-4.0/* ~/.config/gtk-4.0/
mkdir -p ~/.config/xsettingsd
ln -fs ~/.dotfiles/xsettingsd/* ~/.config/xsettingsd/
