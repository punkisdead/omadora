echo "Update Waybar config to fix path issue with update-available icon click"

if grep -q "alacritty --class Omadora --title Omadora -e omadora-update" ~/.config/waybar/config.jsonc; then
  sed -i 's|\("on-click": "alacritty --class Omadora --title Omadora -e \)omadora-update"|\1omadora-update"|' ~/.config/waybar/config.jsonc
  omadora-restart-waybar
fi
