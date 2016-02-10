# gnome-background-rotate
Script to rotate randomly wallpapers over a set of images from a folder.   
## thanks to 
[major.io](https://major.io/2015/02/11/rotate-gnome-3s-wallpaper-systemd-user-units-timers/#disqus_thread)

[stackoverflow](http://stackoverflow.com/questions/10374520/gsettings-with-cron)

## customization
Specify the wallpaper folder in `rotate.sh`:
```
dir="${HOME}/Pictures/wallpapers/"
```

Specify the refresh rate of wallpaper in  `gnome-background-change.timer`:
```
OnCalendar=*:0/1
```
That means refresh every minute.

## setup
```
$ sudo cp rotate.sh /bin/
$ mkdir ~/.config/systemd/user
$ cp gnome-background-change.* ~/.config/systemd/user
$ cd ~/.config/systemd/user
```
Start it and enable at startup
```
$ systemctl --user start gnome-background-change.timer
$ systemctl --user enable gnome-background-change.timer
```

## Issues
- I had noticed that timer doesn't start on reboot, so put `gnome-background-change.desktop` into `~/.config/autostart` to force starting.

### Ubuntu 15.10
This method seems not work with Ubuntu 15.10 and gnome-shell 3.16.4, so the 
follow script might work:
Put the follow file in `/bin/rotate.sh`
```bash
#!/bin/bash

WP_DIR=/path/to/wallpapers
cd $WP_DIR
while [ 1 ] 
do
    set -- * 
    length=$#
    random_num=$((( $RANDOM % ($length) ) + 1)) 

    gsettings set org.gnome.desktop.background picture-options "centered"
    gsettings set org.gnome.desktop.background picture-uri "file://$WP_DIR/${!random_num}"
    sleep 60
done
```

and the following script in `~/.config/autostart`
```bash
[Desktop Entry]
Name=wallpaper-changer
Exec=/bin/rotate.sh
Comment=change wallpaper every so often
Hidden=false
Type=Application
X-GNOME-Autostart-enabled=true
```
