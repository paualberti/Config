#!/bin/bash

# Define source and target directories
SOURCE_DIR="$HOME/Config"
TARGET_DIR="$HOME/.config"

# Initialize new_symlinks for created symlinks
new_symlinks=0

# Initialize num_symlinks for created symlinks
num_symlinks=0

# Ensure the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory $SOURCE_DIR does not exist. Exiting."
  exit 1
fi

# Ensure the target directory exists
mkdir -p "$TARGET_DIR"

echo "List symlinks $TARGET_DIR -> $SOURCE_DIR"
# Loop through items in the source directory
for dir in "$SOURCE_DIR"/*; do
  # Skip if not a directory
  if [ ! -d "$dir" ]; then
    # echo "$dir is not a directory. Skipping."
    continue
  fi

  # Get the directory name
  base_name=$(basename "$dir")
  target_path="$TARGET_DIR/$base_name"

  # Show the symlinks
  echo "$num_symlinks: $target_path -> $dir"
  num_symlinks=$((num_symlinks + 1))

  # If the symlink already exists, skip it
  if [ -L "$target_path" ]; then
    # echo "Symlink for $base_name already exists. Skipping."
    continue
  fi

  # Create the symlink
  ln -s "$dir" "$target_path"
  # echo "Created symlink: $target_path -> $dir"
  new_symlinks=$((new_symlinks + 1))
done

# Report the total number of symlinks created
echo "New symlinks created: $new_symlinks"

# Report total number of symlinks
echo "Total number of symlinks: $num_symlinks"
