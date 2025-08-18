#!/bin/bash

# ==============================================================================
# Hyprland NVIDIA Setup Script for Arch Linux
# ==============================================================================
# This script automates the installation and configuration of NVIDIA drivers
# for use with Hyprland on Arch Linux, following the official Hyprland wiki.
#
# Author: https://github.com/Kn0ax
#
# ==============================================================================

# --- GPU Detection ---
if [ -n "$(lspci | grep -i 'nvidia')" ]; then
  show_logo
  show_subtext "Install NVIDIA drivers..."

  # --- Driver Selection ---
  # Fedora's RPM Fusion repository provides the NVIDIA drivers.
  # We'll install the latest proprietary drivers.
  sudo dnf -y install akmod-nvidia xorg-x11-drv-nvidia-cuda

  # Install VA-API driver
  sudo dnf -y install nvidia-vaapi-driver

  # Configure modprobe for early KMS
  echo "options nvidia_drm modeset=1" | sudo tee /etc/modprobe.d/nvidia.conf >/dev/null

  # Configure dracut for early loading
  sudo dracut --force

  # Add NVIDIA environment variables to hyprland.conf
  HYPRLAND_CONF="$HOME/.config/hypr/hyprland.conf"
  if [ -f "$HYPRLAND_CONF" ]; then
    cat >>"$HYPRLAND_CONF" <<'EOF'

# NVIDIA environment variables
env = NVD_BACKEND,direct
env = LIBVA_DRIVER_NAME,nvidia
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
EOF
  fi
fi
