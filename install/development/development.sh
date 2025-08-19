#!/bin/bash

# Install packages from official repositories
sudo dnf -y install \
  cargo clang llvm \
  ImageMagick \
  mariadb-connector-c postgresql-libs \
  gh \
  cmake marked shellcheck shfmt \
  inotify-tools gcc-c++ \
  wxGTK-devel mesa-libGL-devel autoconf

# Ensure ~/.local/bin exists and is in the PATH for this session
mkdir -p "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"

# Install asdf (version manager) from pre-compiled binary
if ! command -v asdf &>/dev/null; then
  asdf_version="0.18.0"
  arch=$(uname -m)
  case "$arch" in
  x86_64) asdf_arch="amd64" ;;
  aarch64) asdf_arch="arm64" ;;
  *)
    echo "Unsupported architecture: $arch"
    exit 1
    ;;
  esac

  release_name="asdf_${asdf_version}_linux_${asdf_arch}"
  wget "https://github.com/asdf-vm/asdf/releases/download/v${asdf_version}/${release_name}.tar.gz" -O /tmp/asdf.tar.gz
  tar -xzf /tmp/asdf.tar.gz -C /tmp
  mv "/tmp/${release_name}/bin/asdf" "$HOME/.local/bin/asdf"
  rm -rf "/tmp/${release_name}" /tmp/asdf.tar.gz
fi

# Add asdf shims to PATH in .bashrc
if ! grep -q 'asdf/shims' "$HOME/.bashrc"; then
  echo -e '\n# ASDF Version Manager' >>"$HOME/.bashrc"
  echo 'export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"' >>"$HOME/.bashrc"
fi

# Add asdf completions to .bashrc
if ! grep -q 'asdf completion bash' "$HOME/.bashrc"; then
  echo -e '\n# ASDF Completions' >>"$HOME/.bashrc"
  echo '. <(asdf completion bash)' >>"$HOME/.bashrc"
fi

# Add and install asdf plugins
asdf plugin-add lazygit https://github.com/comdotlinux/asdf-lazygit.git
asdf plugin-add lazydocker https://github.com/comdotlinux/asdf-lazydocker.git

asdf install lazygit latest
asdf install lazydocker latest

asdf set lazygit latest
asdf set lazydocker latest
