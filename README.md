v-xfce-random-wallpaper
=======================

Sets the random wallpaper from a folder

Change "dirWallpapers" variable to your wallpapers dir


Cron
----

	$ crontab -e

For changing wallpaper every 12 hours:

	* */12 * * * DISPLAY=:0.0 ${HOME}/.local/bin/v-xfce-random-wallpaper.sh
