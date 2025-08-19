#!/bin/bash

# Install fonts from official repositories
sudo dnf -y install \
  fontawesome-fonts \
  google-noto-fonts-common google-noto-emoji-fonts

if [ -z "$OMADORA_BARE" ]; then
  sudo dnf -y install \
    jetbrains-mono-fonts \
    google-noto-cjk-fonts \
    google-noto-sans-fonts \
    google-noto-serif-fonts
fi

# Install Cascadia Mono Nerd Font manually
if [ ! -f "$HOME/.local/share/fonts/CaskaydiaMonoNerdFont-Regular.ttf" ]; then
  echo "Installing Cascadia Mono Nerd Font..."
  # Create the local fonts directory
  mkdir -p "$HOME/.local/share/fonts"
  
  # Download and unzip the font
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaMono.zip -O /tmp/CascadiaMono.zip
  unzip /tmp/CascadiaMono.zip -d "$HOME/.local/share/fonts/"
  rm /tmp/CascadiaMono.zip
  
  # Rebuild the font cache
  fc-cache -f -v
fi