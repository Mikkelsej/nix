#!/usr/bin/env bash

apps=""
msg=""

if pgrep "onedrive" > /dev/null; then
  apps+="󰅟 "
  msg+="OneDrive is Running"
else
  apps+="󰧠 "
  msg+="OneDrive is Not Running
fi

echo "$apps"
echo "$msg"
