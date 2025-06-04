#!/usr/bin/env bash

apps=""


if pgrep "onedrive" > /dev/null; then
  apps+="󰅟 "
else
  apps+="󰧠 "
fi

echo "$apps"
