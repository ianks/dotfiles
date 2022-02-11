#!/bin/sh

echo "👋 Hello! Your dotfiles will be setup momentarily..."

# Bootstrap yadm to install dotfiles
if [[ ! -d ~/.local/share/yadm ]]; then
  echo "Installing yadm (for dotfile syncing)"
  curl -L bootstrap.yadm.io | bash -s -- https://github.com/ianks/dotfiles-repo
fi
