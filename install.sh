#!/bin/bash

#for FILENAME in $( ls | grep -v README | grep -v install.sh | grep -v web_install.sh ); do echo "installing $FILENAME"; ln -bis "$(pwd)/$FILENAME" "$HOME/.$FILENAME"; done


git submodule update --init --recursive


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
