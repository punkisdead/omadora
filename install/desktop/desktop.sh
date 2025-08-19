#!/bin/bash

# Add the Google Chrome repository
echo -e "[google-chrome]\nname=google-chrome\nbaseurl=https://dl.google.com/linux/chrome/rpm/stable/x86_64\nenabled=1\ngpgcheck=1\ngpgkey=https://dl.google.com/linux/linux_signing_key.pub" | sudo tee /etc/yum.repos.d/google-chrome.repo

# Install desktop applications
sudo dnf -y install \
  brightnessctl playerctl pamixer wireplumber qpwgraph \
  fcitx5 fcitx5-gtk fcitx5-qt5 fcitx5-qt6 \
  nautilus sushi ffmpegthumbnailer gvfs-mtp \
  slurp swappy \
  mpv evince imv \
  google-chrome-stable \
  wf-recorder