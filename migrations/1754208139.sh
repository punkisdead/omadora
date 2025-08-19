echo "Ensure screensaver doesn't start while the computer is locked"

if ! grep -q "pidof hyprlock || omadora-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  omadora-refresh-hypridle
fi
