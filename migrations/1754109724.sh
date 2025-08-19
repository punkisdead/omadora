echo "Add hyprsunset blue light filter"
if ! command -v hyprsunset &>/dev/null; then
  yay -S --noconfirm --needed hyprsunset
fi

omadora-refresh-hyprsunset
