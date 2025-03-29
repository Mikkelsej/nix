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
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    home.file.".config/nwg-dock-hyprland/config.json".text = cfg.configText;
  };
}
