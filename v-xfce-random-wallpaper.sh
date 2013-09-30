#!/bin/bash
# v-xfce-random-wallpaper, version 0.95
# Random wallpaper for XFCE
# github.com/VovanR/v-xfce-random-wallpaper
# Author: VovanR (Vladimir Rodkin)
# twitter.com/VovanR



# Settings #
############

# Wallpaper directory
dirWallpapers="Dropbox/Wallpapers/dlanham wallpapers/Desktop"

# Stype
# 0 - Auto
# 1 - Centered
# 2 - Tiled
# 3 - Stretched
# 4 - Scaled
# 5 - Zoomed
style=0

# File extensions
exts="png jpg jpeg"



# Logics #
##########

# Build wallpapers directory path
dirHome=$(echo $HOME)
dir=$dirHome"/"$dirWallpapers"/"

# Exit if directory doesn't exist
if [ ! -d "$dir" ]; then
	echo -e "Error: Directory \""$dir"\" does not exists"
	exit 2
	# Return 2
	# Exit Status: Incorrect usage
fi


# Build the RegExp to filter files by extensions
regexp=''
for ext in $exts; do
	regexp=$regexp'^.+(\.'$ext')+$|'
done
# Remove last character from string
regexp=${regexp%?}


# Select one random file
file=$(ls "$dir" | grep -Ei $regexp | shuf -n1)

# Exit if directory is empty
if [ -z "$file" ]; then
	echo -e "Error: Directory \""$dir"\" is empty"
	exit 2
	# Return 2
	# Exit Status: Incorrect usage
fi

# The full path of the wallpaper file
file=$dir$file
echo -e $file


# If the style setting value isn't correct, then replace it with the default value
if [ $style -lt 0 ] || [ $style -gt 5 ]; then
    echo -e "Warning: Style value is not correct! Applying default settings"
    style=0
fi


# Setup wallpaper

# File
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s "$file"

# Style
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-style -n -t int -s $style

# Refresh desktop
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-show -s false
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-show -s true


echo -e "Successful execution"
exit 0
# Return 0
# Exit Status: Success