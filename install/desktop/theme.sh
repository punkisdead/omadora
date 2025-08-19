#!/bin/bash

# Install theme and icon packages
sudo dnf -y install kvantum yaru-icon-theme

# Set GTK and icon themes
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"

# Setup theme links
mkdir -p ~/.config/omadora/themes
for f in ~/.local/share/omadora/themes/*; do ln -nfs "$f" ~/.config/omadora/themes/; done

# Set initial theme
mkdir -p ~/.config/omadora/current
ln -snf ~/.config/omadora/themes/tokyo-night ~/.config/omadora/current/theme
ln -snf ~/.config/omadora/current/theme/backgrounds/1-scenery-pink-lakeside-sunset-lake-landscape-scenic-panorama-7680x3215-144.png ~/.config/omadora/current/background

# Set specific app links for current theme
ln -snf ~/.config/omadora/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omadora/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/omadora/current/theme/mako.ini ~/.config/mako/config