echo "Replace volume control GUI with a TUI"

if ! command -v wiremix &>/dev/null; then
  yay -S --noconfirm --needed wiremix
  yay -Rns --noconfirm pavucontrol

  omadora-refresh-applications
  omadora-refresh-waybar
fi
