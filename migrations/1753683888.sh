echo "Adding Omadora version info to fastfetch"
if ! grep -q "omadora" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/omadora/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi

