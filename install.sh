#!/bin/bash

# Update submodules
git submodule update --init --recursive

# Loop through all the files
# and create symlinks/backup previous
# files
for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    echo "Updating $target"
    mv "$target" "$target-$(date +'%s')"
    ln -sf "$PWD/$name" "$target"
  else
    if [ "$name" != "install.sh" -a "$name" != "README" -a "$name" != "web_install.sh" ]; then
      echo "Creating $target"
      ln -sf "$PWD/$name" "$target"
    fi
  fi
done

