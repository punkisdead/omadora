#!/bin/bash

# Install a display manager (sddm) and the boot splash screen (plymouth)
sudo dnf -y install sddm plymouth

# ==============================================================================
# PLYMOUTH SETUP
# ==============================================================================

# Add kernel parameters for Plymouth for a graphical boot
if [ -f "/etc/default/grub" ]; then # Grub
  echo "Detected grub"
  sudo grubby --update-kernel=ALL --args="splash quiet"
else
  echo ""
  echo "GRUB not detected. Please manually add these kernel parameters:"
  echo "  - splash (to see the graphical splash screen)"
  echo "  - quiet (for silent boot)"
  echo ""
fi

# Set the default plymouth theme to omadora
if [ "$(plymouth-set-default-theme)" != "omadora" ]; then
  sudo cp -r "$HOME/.local/share/omadora/default/omadora-plymouth-theme" /usr/share/plymouth/themes/omadora/
  # The -R flag rebuilds the initrd, applying kernel parameters and theme changes
  sudo plymouth-set-default-theme -R omadora
fi

# ==============================================================================
# DISPLAY MANAGER SETUP
# ==============================================================================

# Enable sddm to start on boot
sudo systemctl enable sddm.service

# Disable getty on tty1 as sddm will be running there
sudo systemctl disable getty@tty1.service