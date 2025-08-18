#!/bin/bash

if ! command -v tzupdate &>/dev/null; then
  pip install tzupdate
  sudo tee /etc/sudoers.d/omadora-tzupdate >/dev/null <<EOF
%wheel ALL=(root) NOPASSWD: /usr/bin/tzupdate, /usr/bin/timedatectl
EOF
  sudo chmod 0440 /etc/sudoers.d/omadora-tzupdate
fi
