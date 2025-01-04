#!/bin/sh

# A modular status bar for dwm
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xorg-xsetroot

# Import functions with "$include /route/to/module"
# It is recommended that you place functions in the subdirectory ./bar-functions and use: . "$DIR/bar-functions/dwm_example.sh"

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Import the modules
. "$DIR/bar-functions/dwm_backlight_colored.sh"
. "$DIR/bar-functions/dwm_date_colored.sh"
. "$DIR/bar-functions/dwm_pulse_colored.sh"
. "$DIR/bar-functions/dwm_resources_colored.sh"
. "$DIR/bar-functions/dwm_network_speed_colored.sh"
. "$DIR/bar-functions/dwm_battery_colored.sh"

# Update dwm status bar every second
while true
do
    # Append results of each func one by one to the upperbar string
    upperbar=""
    upperbar="$upperbar$(dwm_network_speed)"; dwm_network_speed_record
    upperbar="$upperbar$(dwm_resources)"
    # upperbar="$upperbar$(get_battery)"
    upperbar="$upperbar$(dwm_backlight)"
    upperbar="$upperbar$(dwm_pulse)"
    upperbar="$upperbar$(dwm_date)"
    # Append results of each func one by one to the lowerbar string
    # lowerbar=""
    
    xsetroot -name "$upperbar"
    # Uncomment the line below to enable the lowerbar 
    #xsetroot -name "$upperbar;$lowerbar"
    sleep 1
done
