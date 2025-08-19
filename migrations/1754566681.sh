echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/omadora/themes/osaka-jade ]]; then
  rm -rf ~/.config/omadora/themes/osaka-jade
  git -C ~/.local/share/omadora checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/omadora/themes/osaka-jade ~/.config/omadora/themes/osaka-jade
fi
