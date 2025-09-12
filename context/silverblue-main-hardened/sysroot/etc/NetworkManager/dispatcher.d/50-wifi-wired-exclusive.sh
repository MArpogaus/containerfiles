#!/bin/bash
# https://neilzone.co.uk/2023/04/networkmanager-automatically-switch-between-ethernet-and-wi-fi/
export LC_ALL=C

# Add the name of your specific ethernet device here, as shown in `nmcli dev`
ETHERNET="enp1s0"

disable_wifi_if_ethernet_is_up ()
{
    result=$(nmcli dev | grep "ethernet" | grep -w "connected")
    if [ -n "$result" ]; then
        nmcli radio wifi off
    fi
}

enable_wifi ()
{
    nmcli radio wifi on

}

if [ "$1" = "$ETHERNET" ] && [ "$2" = "up" ]; then
    disable_wifi_if_ethernet_is_up
fi

if [ "$1" = "$ETHERNET" ] && [ "$2" = "down" ]; then
    enable_wifi
fi
