{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin = "5";
        spacing = 10;

        modules-left = ["hyprland/workspaces" "hyprland/window"];
        modules-center = ["clock"];
        modules-right = ["pulseaudio" "battery" "network" "tray"];

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 50;
        };

        "clock" = {
          format = "{:%Y-%m-%d %H:%M}";
          tooltip = true;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 Muted";
          on-click = "pavucontrol";
          tooltip = false;
          format-icons = ["" "" ""];
        };

        "battery" = {
          format = "{capacity}% {icon}";
          format-charging = "⚡ {capacity}%";
          format-icons = ["" "" "" "" ""];
        };

        "network" = {
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = "󰈀 {ipaddr}";
          format-disconnected = "󰌙 Disconnected";
          tooltip = true;
        };

        "tray" = {
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 5px;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(30, 30, 46, 0.8);
        color: #cdd6f4;
        border-radius: 8px;
        padding: 5px 10px;
      }

      #workspaces button {
        background: transparent;
        border: none;
        color: #cdd6f4;
        padding: 0 5px;
      }

      #workspaces button.active {
        color: #ffcc66;
      }

      #clock, #battery, #network, #pulseaudio, #tray {
        padding: 0 10px;
      }

      #battery.charging {
        color: #a6e3a1;
      }

      #network.disconnected {
        color: #f38ba8;
      }
    '';
  };
}
