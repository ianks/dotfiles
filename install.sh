#!/bin/sh

echo "👋 Hello! Your dotfiles will be setup momentarily..."

# Bootstrap yadm to install dotfiles
if [[ ! -d ~/.local/share/yadm ]]; then
  echo "Installing and bootstraping YADM (for dotfile syncing)..."
  curl -L bootstrap.yadm.io | bash -s -- https://github.com/ianks/dotfiles-repo
else
  echo "YADM config already found, now bootstraping..."
  yadm bootstrap
fi

echo "✅ Done!"
