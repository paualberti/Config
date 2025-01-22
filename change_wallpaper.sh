#!/bin/bash

# Path to the wallpapers directory
WALLPAPER_DIR="$HOME/Config/Wallpapers"

# Select a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

echo $WALLPAPER

# Set the wallpaper using feh
feh --bg-scale "$WALLPAPER"

# Log the change for debugging
echo "Set wallpaper to: $WALLPAPER"
