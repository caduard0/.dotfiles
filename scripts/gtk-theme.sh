#!/bin/zsh

git clone https://github.com/vinceliuice/Graphite-gtk-theme.git /tmp/Graphite-gtk-theme

cd /tmp/Graphite-gtk-theme

./install.sh -c dark -s standard -l --tweaks black rimless

papirus-folders -C black

swww img ~/.dotfiles/disco-thoughtcabinet-wallpaper-4k.png
