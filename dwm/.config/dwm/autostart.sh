#!/bin/sh

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
  xbindkeys -f ~/.config/dwm/keys
fi

# if [ -z $(pidof awatcher) ]; then
#   awatcher &
# fi
# if [ -z $(pidof picom) ]; then
# picom -b

# killall wallpaper_loop
# wallpaper_loop &
wallpaper_change &

xhidecursor &

pamixer -m &

# killall battery_warning
# battery_warning &

# autossh -M 20000 -fNR 7004:localhost:2222 wyz@$SERVER_IP &

# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# /usr/lib/xfce-polkit/xfce-polkit &
# lxpolkit &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
