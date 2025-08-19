echo "Lock 1password on screen lock"

if ! grep -q "omadora-lock-screen" ~/.config/hypr/hypridle.conf; then
  omadora-refresh-hypridle
fi
