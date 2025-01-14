#!/bin/bash

# Source directory (repository root, change if needed)
SOURCE_DIR=$(pwd)

# Determine the target directory (use $XDG_CONFIG_HOME if set, else fallback to ~/.config)
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

# Create the target directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Iterate through directories in the source directory
for DIR in "$SOURCE_DIR"/*/; do
    # Get the base name of the directory
    DIR_NAME=$(basename "$DIR")

    # Target path in CONFIG_DIR
    TARGET_PATH="$CONFIG_DIR/$DIR_NAME"

    # Check if the target directory already exists
    if [ -d "$TARGET_PATH" ]; then
        echo "Directory $DIR_NAME exists in $CONFIG_DIR, creating backup..."
        mv "$TARGET_PATH" "${TARGET_PATH}.bak"
    fi

    # Move the directory to CONFIG_DIR
    echo "Moving $DIR_NAME to $CONFIG_DIR"
    mv "$DIR" "$CONFIG_DIR"
done

echo "All directories have been moved and backups created if needed."
