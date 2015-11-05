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
