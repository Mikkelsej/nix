#!/bin/bash

apps=""

if pgrep -x "discord" > /dev/null; then
  apps+=" "  # Nerd Font Discord icon
fi

if pgrep -x "spotify" > /dev/null; then
  apps+=" "  # Nerd Font Spotify icon
fi

if pgrep -x "onedrive" > /dev/null; then
  apps+="󰏊 "  # Nerd Font OneDrive icon
fi

echo "$apps"
