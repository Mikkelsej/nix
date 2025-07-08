#!/usr/bin/env bash

# Icons:
# 󰾆 (power-saver)
# 󰾅 (balanced)
# 󰓅 (performance)

if [[ -n "$1" ]]; then
    CURRENT=$(powerprofilesctl get)
    case "$CURRENT" in
        "power-saver")
            powerprofilesctl set balanced
            ;;
        "balanced")
            powerprofilesctl set performance
            ;;
        "performance")
            powerprofilesctl set power-saver
            ;;
    esac
fi

CURRENT_PROFILE=$(powerprofilesctl get)

# Set the appropriate icon
case "$CURRENT_PROFILE" in
    "power-saver")
        ICON=" 󰾆 "
        ;;
    "balanced")
        ICON=" 󰾅 "
        ;;
    "performance")
        ICON=" 󰓅 "
        ;;
    *)
        ICON="?"
        ;;
esac

echo "{\"text\": \"$ICON\", \"tooltip\": \"Power Profile: $CURRENT_PROFILE\"}"
