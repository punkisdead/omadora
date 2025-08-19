echo "Allow updating of timezone by right-clicking on the clock (or running omadora-cmd-tzupdate)"
if ! command -v tzupdate &>/dev/null; then
  bash ~/.local/share/omadora/install/config/timezones.sh
  omadora-refresh-waybar
fi
