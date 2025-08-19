#!/bin/bash

# Enable the COPR repository for Hyprland and related tools
sudo dnf -y copr enable solopasha/hyprland
sudo dnf -y check-update

# Install Hyprland and its ecosystem
sudo dnf -y install \
  hyprland hyprshot hyprpicker hyprlock hypridle hyprsunset mate-polkit \
  walker libqalculate waybar mako swaybg \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
