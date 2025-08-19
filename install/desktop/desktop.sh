#!/bin/bash

# Ensure RPM Fusion repositories are enabled and metadata is refreshed
sudo dnf -y install \
  "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
  "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf -y check-update

# Install desktop applications
sudo dnf -y install \
  brightnessctl playerctl pamixer wireplumber qpwgraph \
  fcitx5 fcitx5-gtk fcitx5-qt5 fcitx5-qt6 \
  nautilus sushi ffmpegthumbnailer gvfs-mtp \
  slurp swappy \
  mpv evince imv \
  chromium-freeworld \
  wf-recorder
