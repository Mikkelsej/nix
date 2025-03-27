{
  "layer": "top",
  "position": "top",
  "reload_style_on_change": true,

  "modules-left": [
    "hyprland/workspaces",
    "custom/pacman",
    "tray"
  ],

  "modules-center": [
    "clock"
  ],

  "modules-right": [
    "group/expand",
    "bluetooth",
    "network",
    "battery",
    "custom/notification"
  ],

  "hyprland/workspaces": {
    "format": "{name}",
    "format-icons": {
      "active": "⬤",
      "default": "○",
      "empty": "◌"
    },
    "persistent-workspaces": {
      "*": [1, 2, 3]
    }
  },

  "custom/notification": {
    "tooltip": false,
    "format": "🔔",
    "on-click": "swaync-client -t -sw",
    "escape": true
  },

  "clock": {
    "format": "🕒 {:%H:%M}",
    "interval": 1,
    "tooltip-format": "<tt>{calendar}</tt>",
    "calendar": {
      "format": {
        "today": "<span color='#fAfBfC'><b>{}</b></span>"
      }
    },
    "actions": {
      "on-click-right": "shift_down",
      "on-click": "shift_up"
    }
  },

  "network": {
    "format-wifi": "📶",
    "format-ethernet": "🔌",
    "format-disconnected": "❌",
    "tooltip-format-disconnected": "No connection",
    "tooltip-format-wifi": "{essid} ({signalStrength}%) 📶",
    "tooltip-format-ethernet": "{ifname} 🌐",
    "on-click": "kitty nmtui"
  },

  "bluetooth": {
    "format-on": "🎧",
    "format-off": "❌",
    "format-disabled": "🚫",
    "format-connected-battery": "{device_battery_percentage}% 🎧",
    "format-alt": "{device_alias} 🎧",
    "tooltip-format": "{controller_alias} ({num_connections} connected)",
    "on-click-right": "blueman-manager"
  },

  "battery": {
    "interval": 30,
    "states": {
      "good": 95,
      "warning": 30,
      "critical": 20
    },
    "format": "{capacity}% 🔋",
    "format-charging": "{capacity}% ⚡",
    "format-plugged": "{capacity}% ⚡🔌",
    "format-alt": "{time} 🔋",
    "format-icons": [
      "🔋",
      "🔋",
      "🔋",
      "🔋",
      "🔋",
      "🪫"
    ]
  },

  "custom/expand": {
    "format": "⏷",
    "tooltip": false
  },

  "custom/endpoint": {
    "format": "|",
    "tooltip": false
  },

  "group/expand": {
    "orientation": "horizontal",
    "drawer": {
      "transition-duration": 600,
      "transition-to-left": true,
      "click-to-reveal": true
    },
    "modules": [
      "custom/expand",
      "custom/colorpicker",
      "cpu",
      "memory",
      "temperature",
      "custom/endpoint"
    ]
  },

  "cpu": {
    "format": "🖥️",
    "tooltip": true
  },

  "memory": {
    "format": "🧠"
  },

  "temperature": {
    "critical-threshold": 80,
    "format": "🌡️"
  },

  "tray": {
    "icon-size": 14,
    "spacing": 10
  }
}
