echo "Fix dancing workspace numbers in Waybar"

if ! grep -q 'min-width: 9px' ~/.config/waybar/style.css; then
  omadora-refresh-waybar
fi
