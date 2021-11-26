#!/bin/bash

# Get APPDATA location
echo "Get %APPDATA% value using - \$env:APPDATA - in PowerShell"
echo "Please input %APPDATA% from Windows:"
read -r APPDATA

# Replace every backslash with frontslash
mnt_path=${APPDATA:3}
mnt_path="/mnt/c/${mnt_path//'\'/"/"}/wsltty/themes/"

printf "\nCopying wsltty ayu_mirage theme into $mnt_path\n"
mkdir -p "${mnt_path}"
cp ~/.config/windows/ayu_mirage "${mnt_path}"
