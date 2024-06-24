#!/bin/bash

# legacy mainsailos and fluiddpi installations didn't have everything under ~/printer_data
# the data-path-fix.sh script symlinks the legacy folders into ~/printer_data
# however, this means git can't back them up. 
# this script resolves the symlinks, moves their contents into the correct ~/printer_data folder,
# and then deletes the symlink

dirs_to_fix=$(find ~/printer_data -type l -xtype d)
for d in $dirs_to_fix ; do
      if [ -L "$d" ]; then
      temp="$(readlink "$d")";
      echo "Fixing ${temp}...";
      rm -rf "$d";
      cp -rf "$temp" "$d";
  fi
done