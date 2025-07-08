#!/usr/bin/env bash
# Waybar
waybar &

# Network Manager Applet
nm-applet --indicator &

# Onedrive
onedrive -m --disable-notifications &