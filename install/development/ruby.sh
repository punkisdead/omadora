#!/bin/bash

# Ensure asdf is in the PATH for this script
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Install dependencies for building Ruby
sudo dnf -y install openssl-devel readline-devel zlib-devel libyaml-devel libffi-devel gdbm-devel ncurses-devel

# Add the Ruby plugin to asdf
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

# Install the latest stable version of Ruby
asdf install ruby latest

# Set the global Ruby version
asdf set ruby latest
