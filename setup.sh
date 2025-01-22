#!/bin/bash

sudo apt-get update
sudo apt upgrade -y

# Install NerdFont
font_path="$HOME/.local/share/fonts"
font_name="$font_path/SauceCodeProNerdFont"
base_name=$(basename "$font_name")
if [ ! -d "$font_name" ]; then
  mkdir -p "$font_name"
  curl -Lo "$font_name.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.zip"
  unzip "$font_name.zip" -d "$font_name"
  rm "$font_name.zip"
  echo "Installed $base_name"
else
  echo "$base_name already installed"
fi

# List of packages to install
read -r -d '' PACKAGES <<EOL
vim
ripgrep
gnome-tweaks
tree
fzf
neofetch
openjdk-17-jre-headless
openjdk-17-jdk-headless
python3.10-venv
ruby-rubygems
EOL

# Convert the list into an array
PACKAGES_ARRAY=($PACKAGES)

# Initialize a counter for installed packages
installed_count=0

# Loop through each package
for package in "${PACKAGES_ARRAY[@]}"; do
  # Check if the package is already installed
  sudo apt install -y "$package"
  if [ $? -eq 0 ]; then
    echo "$package installed successfully."
    installed_count=$((installed_count + 1))
  else
    echo "Failed to install $package. Please check for issues."
  fi
done

# Markdownlint
sudo gem install mdl

# Print summary
echo "Total new packages installed: $installed_count"

# Neovim
if ! command -v nvim >/dev/null 2>&1; then
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  sudo rm -rf /opt/nvim
  sudo tar -C /opt -xzf nvim-linux64.tar.gz
  rm nvim-linux64.tar.gz
  echo "export PATH=\"$PATH:/opt/nvim-linux64/bin\"" >> ~/.bashrc
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
fi

echo "Total new packages installed: $installed_count"
echo "Version: $(nvim --version)"
echo "Version: $(ghostty --version)"

sudo apt autoremove -y
