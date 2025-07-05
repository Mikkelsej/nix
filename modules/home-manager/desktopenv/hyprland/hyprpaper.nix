{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/.config/wallpapers/sundown-over-sea.png
    wallpaper = ,~/.config/wallpapers/sundown-over-sea.png
    splash = false
  '';

}