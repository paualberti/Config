#!/bin/bash

# Install NerdFont
font_path="$HOME/.local/share/fonts"
font_name="$font_path/SauceCodeProNerdFont"
base_name=$(basename "$font_name")
if [ ! -d "$font_name" ]; then
  mkdir -p "$font_name"
  curl -Lo "$font_name.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.zip"
  unzip "$font_name.zip" -d "$font_name"
  rm "$font_name.zip"
  echo "Installed $base_name: $font_name"
else
  echo "$base_name already installed: $font_name"
fi

# Install utilities
sudo apt-get update
sudo apt upgrade
sudo apt-get install \
  vim\
  ripgrep\
  gnome-tweaks\
  tree\
  neofetch\
  fzf\

# Install from pre-built archives

# Neovim
if ! command -v nvim >/dev/null 2>&1; then
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  sudo rm -rf /opt/nvim
  sudo tar -C /opt -xzf nvim-linux64.tar.gz
  echo "export PATH=\"$PATH:/opt/nvim-linux64/bin\"" >> ~/.bashrc
else
  echo "Neovim is already installed at $(command -v nvim)"
  echo "Version: $(nvim --version | head -n 1)"
fi

# Ghostty
if ! command -v ghostty >/dev/null 2>&1; then
  source /etc/os-release
  GHOSTTY_DEB_URL=$(
     curl -s https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest | \
     grep -oP "https://github.com/mkasberg/ghostty-ubuntu/releases/download/[^\s/]+/ghostty_[^\s/_]+_amd64_${VERSION_ID}.deb"
  )
  GHOSTTY_DEB_FILE=$(basename "$GHOSTTY_DEB_URL")
  curl -LO "$GHOSTTY_DEB_URL"
  sudo dpkg -i "$GHOSTTY_DEB_FILE"
  rm "$GHOSTTY_DEB_FILE"
else
  echo "Ghostty is already installed at $(command -v ghostty)"
  echo "Version: $(nvim --version | head -n 1)"
fi
