{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.nwg-dock-hyprland;
in {
  options.programs.nwg-dock-hyprland = {
    enable = mkEnableOption "Enable nwg-dock-hyprland, a dock for Hyprland";

    package = mkOption {
      type = types.package;
      default = pkgs.nwg-dock-hyprland;
      description = "The nwg-dock-hyprland package to install.";
    };

    configText = mkOption {
      type = types.str;
      default = ''
        {
          "layer": "top",
          "position": "bottom",
          "alignment": "center",
          "exclusive": true,
          "margin": 10,
          "icon_size": 48,
          "background": "rgba(40, 40, 40, 0.8)",
          "border_radius": 10,
          "monitor": "",
          "show": "always",
          "commands": [
            { "label": "Terminal", "exec": "kitty", "icon": "utilities-terminal" },
            { "label": "Browser", "exec": "firefox", "icon": "firefox" },
            { "label": "Files", "exec": "thunar", "icon": "system-file-manager" }
          ]
        }
      '';
      description = "Raw JSON config for nwg-dock-hyprland.";
    };

    styleText = mkOption {
      type = types.str;
      default = ''
        window {
          background: rgba(0, 0, 0, 0.8);
          border-radius: 10px;
          border-style: solid;
          border-width: 3px;
          border-color: #ffffff;
          opacity: 0.8;
        }

        #box {
          /* Define attributes of the box surrounding icons here */
          padding: 10px;
        }

        #active {
          /* This is to underline the button representing the currently active window */
          border-bottom: solid 0px;
          border-color: #FFFFFF;
        }

        button, image {
          background: none;
          border-style: none;
          box-shadow: none;
          color: #999;
        }

        button {
          padding: 4px;
          margin-left: 4px;
          margin-right: 4px;
          color: #eee;
          font-size: 12px;
        }

        button:hover {
          background-color: rgba(255, 255, 255, 0.15);
          border-radius: 10px;
        }

        button:focus {
          box-shadow: none;
        }
      '';
      description = "CSS styling for nwg-dock-hyprland.";
    };

    launchScript = mkOption {
      type = types.str;
      default = ''
        #!/bin/sh
        nwg-dock-hyprland -i 32 -w 5 -mb 10 -ml 10 -mr 10 -x -s "style.css" -c "rofi -show drun"
      '';
      description = "Launch script for nwg-dock-hyprland.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    home.file.".config/nwg-dock-hyprland/config.json".text = cfg.configText;
    home.file.".config/nwg-dock-hyprland/style.css".text = cfg.styleText;

    # Ensure launch.sh is executable
    home.file.".config/nwg-dock-hyprland/launch.sh" = {
      text = cfg.launchScript;
      executable = true;
    };
  };
}
