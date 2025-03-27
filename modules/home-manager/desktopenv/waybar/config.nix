# waybar/config.nix
{ config, pkgs, ... }:

{
  settings = [{
        "layer" = "top";
    "position" = "top";
    "reload_style_on_change" = true;
    "modules-left" = [
        "hyprland/workspaces"
        "custom/pacman"
        "tray"
    ];
    "modules-center" = [
        "clock"
    ];
    "modules-right" = [
        "group/expand"
        "pulseaudio"
        "bluetooth"
        "network"
        "battery"
        "custom/notification"
    ];
    "hyprland/workspaces" = {
        "format" = "{name}";
        "format-icons" = {
            "active" = "⬤";
            "default" = "○";
            "empty" = "◌";
        };
        "persistent-workspaces" = {
            "*" = [
                1
                2
                3
            ];
        };
    };
    "custom/notification" = {
        "tooltip" = false;
        "format" = "🔔";
        "on-click" = "swaync-client -t -sw";
        "escape" = true;
    };
    "clock" = {
        "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        "format-alt" = "{:%d-%m-%Y}";
    };
    "network" = {
        "format-wifi" = "🛜";
        "format-ethernet" = "🔌";
        "format-disconnected" = "❌";
        "tooltip-format-disconnected" = "No connection";
        "tooltip-format-wifi" = "{essid} ({signalStrength}%) 🛜";
        "tooltip-format-ethernet" = "{ifname} 🌐";
        "on-click" = "kitty --title 'Network Manager' -e nmtui";
    };
    "bluetooth" = {
        "format-on" = "🎧";
        "format-off" = "❌";
        "format-disabled" = "🚫";
        "format-connected-battery" = "{device_battery_percentage}% 🎧";
        "format-alt" = "{device_alias} 🎧";
        "tooltip-format" = "{controller_alias} ({num_connections} connected)";
        "on-click" = "blueman-manager";
    };
    "pulseaudio" = {
        format = "{volume}% 🔊 ";
        "format-muted" = "🔇 ";
        "format-source-muted" = "🔕";
        on-click = "pavucontrol";
      };
    "battery" = {
        "interval" = 30;
        "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 20;
        };
        "format" = "{capacity}% 🔋";
        "format-charging" = "{capacity}% ⚡";
        "format-plugged" = "{capacity}% ⚡🔌";
        "format-alt" = "{time} 🔋";
        "format-icons" = [
            "🔋"
            "🔋"
            "🔋"
            "🔋"
            "🔋"
            "🪫"
        ];
    };
    "custom/expand" = {
        "format" = "⏷";
        "tooltip" = false;
    };
    "custom/endpoint" = {
        "format" = "|";
        "tooltip" = false;
    };
    "group/expand" = {
        "orientation" = "horizontal";
        "drawer" = {
            "transition-duration" = 600;
            "transition-to-left" = true;
            "click-to-reveal" = true;
        };
        "modules" = [
            "custom/expand"
            "custom/colorpicker"
            "cpu"
            "memory"
            "temperature"
            "custom/endpoint"
        ];
    };
    "cpu" = {
        "format" = "🖥️";
        "tooltip" = true;
    };
    "memory" = {
        "format" = "🧠";
    };
    "temperature" = {
        "critical-threshold" = 80;
        "format" = "🌡️";
    };
    "tray" = {
        "icon-size" = 14;
        "spacing" = 10;
    };
  }];
}
