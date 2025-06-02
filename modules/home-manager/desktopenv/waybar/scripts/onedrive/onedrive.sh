#!/usr/bin/env bash

apps=""


if pgrep "onedrive" > /dev/null; then
  apps+="󰅟 "  # Nerd Font OneDrive icon
fi

echo "$apps"
