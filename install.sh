#!/bin/sh

set -e

YADM_VERSION="3.1.1"
YADM_CHECKSUM="9c51f08b9be8658708b718c00c93024b122d83b6a4244836cb6d194064160d18"
DOTFILES_REPO="https://github.com/ianks/dotfiles-repo"

install_yadm() {

  if command -v yadm; then
    echo "Detected installed yadm, no need to install"
  else
    echo "Installing and bootstraping YADM (for dotfile syncing)..."
    curl -so /tmp/yadm "https://raw.githubusercontent.com/TheLocehiliosan/yadm/$YADM_VERSION/yadm"

    if ! echo "$YADM_CHECKSUM  /usr/local/bin/yadm" | shasum -a 256 -c; then
      echo "⚠️ YADM checksum mismatch, exiting"
      exit 1
    fi

    chmod +x /tmp/yadm
    sudo mv /tmp/yadm /usr/local/bin/
  fi
}

echo "👋 Hello! Your dotfiles will be setup momentarily..."
install_yadm
yadm clone "$DOTFILES_REPO"
chmod +x "$HOME/.config/yadm/bootstrap" && yadm bootstrap
echo "✅ Done!"
