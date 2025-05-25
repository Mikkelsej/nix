{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/scripts/startup.sh".text = ''
    #!/usr/bin/env bash
    # Wallpaper
    waypaper --wallpaper nixos/wallpapers/sundown-over-sea.jpg & 

    # Waybar
    waybar &

    # Network Manager Applet
    nm-applet --indicator &
  '';

  home.file.".config/hypr/scripts/startup.sh".executable = true;
}
