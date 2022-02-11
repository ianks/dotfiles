#!/bin/sh

echo "👋 Hello! Your dotfiles will be setup momentarily..."


# Bootstrap yadm to install dotfiles
if ! command -v yadm > /dev/null; then
  echo "Installing and bootstraping YADM (for dotfile syncing)..."

  YADM_BOOTSTRAP_CHECKSUM=a263208a09756079e4b1f1776a656d62ddc5d945d75241cb67d6ad7f5b87a983
  curl -o /tmp/yadm-bootstrap -L https://raw.githubusercontent.com/TheLocehiliosan/yadm/3d82aff3e8140361fca18f664fffa64dfd33296e/bootstrap

  if ! echo "$YADM_BOOTSTRAP_CHECKSUM  /tmp/yadm-bootstrap" | shasum -a 256 -c; then
    echo "⚠️ Checksum failed for yadm bootstrap"
    exit 1
  fi

  chmod +x /tmp/yadm-bootstrap
  /tmp/yadm-bootstrap
  rm /tmp/yadm-bootstrap
else
  echo "YADM config already found, now bootstraping..."
  yadm bootstrap
fi

echo "✅ Done!"
