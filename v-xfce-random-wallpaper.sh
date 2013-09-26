#!/bin/bash
# v-xfce-random-wallpaper, version 0.9
# Random wallpaper for XFCE
# github.com/VovanR/v-xfce-random-wallpaper
# Author: VovanR (Vladimir Rodkin)
# twitter.com/VovanR


# Wallpaper directory
dirWallpapers="Dropbox/Wallpapers/dlanham wallpapers/Desktop"
dirHome=$(echo $HOME)
dir=$dirHome"/"$dirWallpapers"/"

# Exit if directory doesn't exist
if [ ! -d "$dir" ]; then
    echo -e "Error: Directory \""$dir"\" does not exists"
    exit 2
	# Return 2
	# Exit Status: Incorrect usage
fi

# Select one random file
file=$(ls "$dir" | shuf -n1)
file=$dir$file

# The full path of the wallpaper file
echo -e $file


# Setup wallpaper

# File
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s "$file"

# Style
# 0 - Auto
# 1 - Centered
# 2 - Tiled
# 3 - Stretched
# 4 - Scaled
# 5 - Zoomed
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-style -s 0

# Refresh desktop
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-show -s false
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-show -s true


echo -e "Successful execution"
exit 0
# Return 0
# Exit Status: Success