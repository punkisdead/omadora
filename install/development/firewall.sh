#!/bin/bash

# Ensure firewalld is running
sudo systemctl enable --now firewalld

# Get the active zone
active_zone=$(firewall-cmd --get-active-zones | head -n 1 | awk '{print $1}')
if [ -z "$active_zone" ]; then
  # If no zone is active, fall back to the default zone
  active_zone=$(firewall-cmd --get-default-zone)
fi

echo "Configuring firewall for zone: $active_zone"

# Allow ports for LocalSend (permanently)
sudo firewall-cmd --zone=$active_zone --add-port=53317/tcp --permanent
sudo firewall-cmd --zone=$active_zone --add-port=53317/udp --permanent

# Allow SSH in (permanently)
sudo firewall-cmd --zone=$active_zone --add-service=ssh --permanent

# Reload the firewall to apply permanent rules
sudo firewall-cmd --reload

# Docker's daemon.json should be configured to use a specific DNS.
# For containers to reach the host's DNS resolver (if needed),
# that would typically be handled by Docker's network setup.
# If direct access to host's port 53 is needed from the docker bridge,
# a more specific rule would be required, but this is not a common default.
# firewalld and Docker integrate well, so no special "ufw-docker" is needed.