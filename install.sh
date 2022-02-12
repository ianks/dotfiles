#!/bin/sh

set -e

DOTFILES_REPO="https://github.com/ianks/dotfiles-repo"

install_yadm() {
  if command -v yadm; then
    echo "Detected installed yadm, no need to install"
  else
    echo "Installing and bootstraping YADM (for dotfile syncing)..."
    if command -v apt-get > /dev/null; then
      sudo apt-get install -y yadm
    elif command -v brew; then
      brew install yadm
    elif command -v yay; then
      yay -Syu yadm-git
    else
      echo "⚠️ Could not find a suitable package manager for yadm"
      exit 1
    fi
  fi
}

echo "👋 Hello! Your dotfiles will be setup momentarily..."
install_yadm
yadm clone "$DOTFILES_REPO"
chmod +x "$HOME/.config/yadm/bootstrap" && yadm bootstrap
echo "✅ Done!"
