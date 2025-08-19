#!/bin/bash

# Install bluetooth controls
sudo dnf -y install blueman

# Turn on bluetooth by default
sudo systemctl enable --now bluetooth.service