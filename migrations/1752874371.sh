echo "Add Catppuccin Latte light theme"
if [[ ! -L "~/.config/omadora/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/omadora/themes/catppuccin-latte ~/.config/omadora/themes/
fi
