#!/bin/bash

# Define source and target directories
SOURCE_DIR="$HOME/Config"
TARGET_DIR="$HOME/.config"

# Initialize num_symlinks for created symlinks
num_symlinks=0

# Ensure the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
	echo "Source directory $SOURCE_DIR does not exist. Exiting."
	exit 1
fi

# Ensure the target directory exists
mkdir -p "$TARGET_DIR"

echo "Symlink list"
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
  num_symlinks=$((num_symlinks + 1))
  echo "$num_symlinks: $target_path -> $dir"

  # If the symlink already exists, skip it
  if [ -L "$target_path" ]; then
	  # echo "Symlink for $base_name already exists. Skipping."
	  continue
  fi

  # Create the symlink
  ln -s "$dir" "$target_path"
  # echo "Created symlink: $target_path -> $dir"
done

h_vim=$HOME/.vimrc
c_vim=$SOURCE_DIR/.vimrc
if [ -f $h_vim ]; then
	rm $h_vim
fi
ln -s $c_vim $h_vim
num_symlinks=$((num_symlinks + 1))
echo "$num_symlinks: $h_vim -> $c_vim"

# Report total number of symlinks
echo "Total number of symlinks: $num_symlinks"
