#!/bin/sh
# pulseaudio --start
set +e

# obs
# dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
# /usr/lib/xdg-desktop-portal-wlr &
# night light
# wlsunset -T 3501 -t 3500 &

# wallpaper
swaybg -i ~/Pictures/wallpapers/arch.png &

# top bar
# waybar -c ~/.config/maomao/waybar/config -s ~/.config/maomao/waybar/style.css &

# dock
# lavalauncher -c ~/.config/maomao/lavalauncher/lavalauncher.conf &

# xwayland dpi scale
# echo "Xft.dpi: 140" | xrdb -merge #dpi缩放
# xrdb merge ~/.Xresources

# ime input
fcitx5 --replace -d &

# keep clipboard content
# wl-clip-persist --clipboard regular --reconnect-tries 0 &
# clipboard content manager
# wl-paste --type text --watch cliphist store & 
# for private use not for you
# cp ~/.config/eww/System-Menu/eww.yuck.hyprland  ~/.config/eww/System-Menu/eww.yuck
# eww daemon &

# idle to lightdown and shutdown screen
# ~/.config/maomao/scripts/idle.sh &

# inhibit by audio
# sway-audio-idle-inhibit &

# change light value and volume value by swayosd-client in keybind
# swayosd-server &

if [ -z $(pidof dunst)]; then
dunst &
fi

if [ -z $(pidof foot)]; then
foot -s &
fi


# Permission authentication
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# blueman-applet &
# killall blueman-applet
# blueman-applet &
# killall blueberry-tray
# blueberry-tray &
# if [ -z $(pidof blueberry-tray) ]; then
# fi
# nm-applet &
autossh -M 20000 -fNR 7004:localhost:2222 wyz@$DEBIAN_IP
