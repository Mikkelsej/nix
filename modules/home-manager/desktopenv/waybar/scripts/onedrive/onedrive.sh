#!/usr/bin/env bash

if pgrep "onedrive" > /dev/null; then
  icon="󰅟 "
  msg="OneDrive is Running"
else
  icon="󰧠 "
  msg="OneDrive is Not Running"
fi

echo "{\"text\": \" $icon \", \"tooltip\": \" $msg \"}"
