#!/usr/bin/env bash

if [[ "$1" == "1" ]]; then
    CURRENT=$(powerprofilesctl get)
    if [[ "$CURRENT" == "performance" ]]; then
        powerprofilesctl set balanced
    else
        powerprofilesctl set performance
    fi
fi

CURRENT_PROFILE=$(powerprofilesctl get)

echo "{\"text\": \"$CURRENT_PROFILE\", \"tooltip\": \"Power Profile: $CURRENT_PROFILE\"}"
