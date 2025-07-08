{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = /home/mikke/nixos/wallpapers/sundown-over-sea.jpg
    wallpaper = ,/home/mikke/nixos/wallpapers/sundown-over-sea.jpg
    splash = false
  '';
}
