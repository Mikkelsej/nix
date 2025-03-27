{ config, pkgs, ... }:

let
  waybarConfig = import ./config.nix { inherit config pkgs; };
  waybarStyle = import ./style.nix;
in

{
  programs.waybar = {
    enable = true;
    settings = waybarConfig.settings;
    style = waybarStyle;
  };
}
