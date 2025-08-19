echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/omadora/themes/ristretto ]]; then
  ln -nfs ~/.local/share/omadora/themes/ristretto ~/.config/omadora/themes/
fi
