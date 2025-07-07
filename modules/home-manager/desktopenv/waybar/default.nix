{ config, pkgs, ... }:

let
  waybarConfig = import ./config.nix { inherit config pkgs; };
  waybarStyle = import ./style.nix { inherit config pkgs; };
in

{
  programs.waybar = {
    enable = true;
    settings = waybarConfig.settings;
    style = waybarStyle.style;
  };

  home.packages = with pkgs; [
    swaynotificationcenter
  ];
}
