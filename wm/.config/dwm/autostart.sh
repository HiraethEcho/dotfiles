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
if [ -z $(pidof picom) ]; then
  picom -b
fi
if [ -z $(pidof nm-applet) ]; then
  nm-applet &
fi
# killall pasystray
# pasystray &

# killall blueman-applet
# blueman-applet &

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

wallpaper_change &
