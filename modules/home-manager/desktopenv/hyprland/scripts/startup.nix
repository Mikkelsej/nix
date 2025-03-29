{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/scripts/startup.sh".text = ''
    #!/usr/bin/env bash
    # Wallpaper
    waypaper --wallpaper .config/wallpapers/sundown-over-sea.jpg 

    # Waybar
    waybar &

    swaync
  '';

  home.file.".config/hypr/scripts/startup.sh".executable = true;
}
