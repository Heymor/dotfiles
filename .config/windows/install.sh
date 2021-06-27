#!/bin/bash

# Get APPDATA location
echo "Get %APPDATA% value using - \$env:APPDATA"
echo "Please input %APPDATA% from Windows:"
read -r APPDATA

# Replace every backslash with frontslash
mnt_path=${APPDATA:3}
mnt_path="/mnt/c/${mnt_path//'\'/"/"}/alacritty/"

printf "\nCopying alacritty.yml into $mnt_path\n"
mkdir -p "${mnt_path}"
cp ~/.config/windows/alacritty.yml "${mnt_path}"
