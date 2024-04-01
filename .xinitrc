#!/bin/sh
# vim: filetype=sh : sta : sw=4 : ts=4 : noet : sts=4
exec xrdb $HOME/.Xresources &
exec picom &
exec dbus-run-session pipewire &
exec dbus-run-session pipewire-pulse &
exec dbus-run-session wireplumber &
[ -r "$HOME/images/wallpaper" -o -r "$HOME/Images/wallpaper" -o -r "$HOME/.wallpaper" ] && wall = yes
[ "$wall" = yes ] && \
	[ -r "$HOME/images/wallpaper" ] && wall = "$HOME/images/wallpaper"
[ "$wall" = yes ] && \
	[ -r "$HOME/Images/wallpaper" ] && wall = "$HOME/Images/wallpaper"
[ "$wall" = yes ] && \
	[ -r "$HOME/.wallpaper" ] && wall = "$HOME/.wallpaper"
[ "$wall" = yes ] && \
	color = yes && \
	wall = no

[ "$color" = yes ] && \
	[ -r "$HOME/.Xresources" ] && grep -q '[*]color3:' "$HOME/.Xresources" && color = `grep '[*]color3: ' "$HOME/.Xresources" | sed 's/.*[*]color3:[ \t]*#/#/'`

exec feh --bg-fill "/home/user/images/wallpaper" &
[ ! "$wall" = no ] && \
	exec feh --bg-fill "$wall" &
[ ! "$color" = yes -a ! "$color" = "" ] && \
	exec xsetroot -solid "$color" &

dbus-run-session i3
