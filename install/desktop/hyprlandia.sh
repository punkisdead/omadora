#!/bin/bash

# Enable the COPR repository for Hyprland and related tools
sudo dnf -y copr enable solopasha/hyprland

# Install Hyprland and its ecosystem
sudo dnf -y install \
  hyprland hyprshot hyprpicker hyprlock hypridle hyprsunset mate-polkit \
  wofi waybar mako swaybg \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# Create a Wayland session file for the display manager
sudo mkdir -p /usr/share/wayland-sessions
sudo tee /usr/share/wayland-sessions/hyprland.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Hyprland
Comment=An elegant, feature-rich, dynamic tiling Wayland compositor
Exec=Hyprland
Type=Application
EOF
