{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = /home/mikke/nix/wallpapers/sundown-over-sea.jpg
    wallpaper = ,/home/mikke/nix/wallpapers/sundown-over-sea.jpg
    splash = false
  '';
}
