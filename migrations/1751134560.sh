echo "Add UWSM env"

export OMARCHY_PATH="$HOME/.local/share/omadora"
export PATH="$OMARCHY_PATH/bin:$PATH"

mkdir -p "$HOME/.config/uwsm/"
omadora-refresh-config uwsm/env

echo -e "\n\e[31mOmadora bins have been added to PATH (and OMARCHY_PATH is now system-wide).\nYou must immediately relaunch Hyprland or most Omadora cmds won't work.\nPlease run Omadora > Update again after the quick relaunch is complete.\e[0m"
echo

gum confirm "Ready to relaunch Hyprland? (All applications will be closed)" &&
  touch ~/.local/state/omadora/migrations/1751134560.sh &&
  uwsm stop
