echo "Add new matte black theme"

if [[ ! -L "~/.config/omadora/themes/matte-black" ]]; then
  ln -snf ~/.local/share/omadora/themes/matte-black ~/.config/omadora/themes/
fi
