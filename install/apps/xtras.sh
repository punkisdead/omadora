#!/bin/bash

if [ -z "$OMADORA_BARE" ]; then
  # --- RPM Installations ---
  sudo dnf -y install \
    flatpak gnome-calculator gnome-keyring libreoffice

  # --- Flatpak Installations ---
  # Add the Flathub repository
  sudo flatpak remote-add-if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  
  # Install apps from Flathub
  sudo flatpak install -y flathub \
    com.spotify.Client \
    us.zoom.Zoom

  # --- 1Password Installation ---
  # Add the 1Password repository
  sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
  sudo sh -c 'echo -e "[1password]\nname=1Password\nbaseurl=https://downloads.1password.com/linux/rpm/stable/$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
  
  # Install 1Password
  sudo dnf -y install 1password 1password-cli || echo -e "\e[31mFailed to install 1password. Continuing without!\e[0m"
fi

# Copy over Omadora applications
omadora-refresh-applications || true