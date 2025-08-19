echo "Start screensaver automatically after 1 minute and stop before locking"

if ! grep -q "omadora-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  omadora-refresh-hypridle
  omadora-refresh-hyprlock
fi
