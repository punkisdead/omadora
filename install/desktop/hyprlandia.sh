#!/bin/bash

# Enable the COPR repository for Hyprland and related tools
sudo dnf -y copr enable solopasha/hyprland

# Install Hyprland and its ecosystem
sudo dnf -y install \
  hyprland hyprshot hyprpicker hyprlock hypridle hyprsunset polkit-gnome \
  walker libqalculate waybar mako swaybg 
xdg-desktop-portal-hyprland xdg-desktop-portal-gtk