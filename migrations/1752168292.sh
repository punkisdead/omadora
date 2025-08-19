echo "Enable battery low notifications for laptops"

if ls /sys/class/power_supply/BAT* &>/dev/null && [[ ! -f ~/.local/share/omadora/config/systemd/user/omadora-battery-monitor.service ]]; then
  mkdir -p ~/.config/systemd/user

  cp ~/.local/share/omadora/config/systemd/user/omadora-battery-monitor.* ~/.config/systemd/user/

  systemctl --user daemon-reload
  systemctl --user enable --now omadora-battery-monitor.timer || true
fi
