#!/bin/bash

if [ -z "$OMADORA_BARE" ]; then
  # --- RPM Installations ---
  sudo dnf -y install \
    flatpak gnome-calculator gnome-keyring libreoffice

  # --- Flatpak Installations ---
  # Add the Flathub repository if it doesn't exist
  if ! flatpak remotes | grep -q "flathub"; then
    sudo flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo
  fi
  
  # Install apps from Flathub
  sudo flatpak install -y flathub \
    com.spotify.Client \
    us.zoom.Zoom

  # --- 1Password Installation ---
  # Use the official script to add the repository and install
  curl -sS https://downloads.1password.com/linux/install.sh | sh || echo -e "\e[31mFailed to install 1password. Continuing without!\e[0m"
fi

# Copy over Omadora applications
omadora-refresh-applications || true