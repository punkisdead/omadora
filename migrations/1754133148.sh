echo "Update Waybar CSS to dim unused workspaces"

if ! grep -q "#workspaces button\.empty" ~/.config/waybar/style.css; then
  omadora-refresh-config waybar/style.css
  omadora-restart-waybar
fi
