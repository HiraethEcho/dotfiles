#!/bin/sh
# pulseaudio --start

killall xbindkeys
mykeys &
# if [ -z $(pidof xbindkeys)]; then
# fi

# killall fcitx5
# fcitx5 &
# if [ -z $(pidof fcitx5)]; then
# fi

killall dunst
dunst &
# if [ -z $(pidof dunst)]; then
# fi

# killall picom
# picom -b
# if [ -z $(pidof picom)]; then
# fi

# killall blueman-applet
# blueman-applet &
# killall blueberry-tray
# blueberry-tray &
# if [ -z $(pidof blueberry-tray) ]; then
# fi

# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# /usr/lib/xfce-polkit/xfce-polkit &
# lxsession &

# killall wallpaper_loop
# wallpaper_loop &

# wallpaper_change &

# killall battery_warning 
# battery_warning &

killall dwmblocks
dwmblocks &

# xnb &

# if [ -z "$GNOME_KEYRING_CONTROL" ]; then
#     eval $(gnome-keyring-daemon --start)
# fi

# if [ -z $(pidof dwmblocks) ]; then
# fi
#
# autossh -M 20000 -fNR 7004:localhost:2222 wyz@2408:8207:1963:c5d0:336f:8d38:d21a:7600
autossh -M 20000 -fNR 7004:localhost:2222 wyz@$DEBIAN_IP
