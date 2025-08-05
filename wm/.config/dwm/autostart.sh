#!/bin/sh

set +e

if [ -z $(pidof fcitx5) ]; then
fcitx5 --replace -d &
fi
if [ -z $(pidof dunst) ]; then
dunst &
fi
if [ -z $(pidof dwmblocks) ]; then
dwmblocks &
fi
if [ -z $(pidof xbindkeys) ]; then
mykeys &
fi

# if [ -z $(pidof aw-qt) ]; then
# aw-qt &
# fi

# if [ -z $(pidof picom) ]; then
# picom -b
# fi
# if [ -z $(pidof blueberry-tray) ]; then
# fi

# /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# /usr/lib/xfce-polkit/xfce-polkit &
# lxsession &
lxpolkit &

# killall wallpaper_loop
# wallpaper_loop &

wallpaper_change &

xhidecursor &

pamixer -m &

# killall battery_warning 
# battery_warning &
#
# killall dwmblocks
# dwmblocks &

# autossh -M 20000 -fNR 7004:localhost:2222 wyz@2408:8207:1963:c5d0:336f:8d38:d21a:7600
# autossh -M 20000 -fNR 7004:localhost:2222 wyz@$DEBIAN_IP &
