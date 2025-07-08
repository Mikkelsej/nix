
{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/conf/autostart.conf".text = ''

    # Autostart docker
    exec-once = ~/.config/nwg-dock-hyprland/launch.sh

    # Autostart Notification Daemon
    exec-once = swaync

    # Autostart Wallpaper
    exec-once = hyprpaper
    # Using hypridle to start hyprlock
    exec-once = hypridle

    # Polkit authentication
    exec-once = systemctl --user start hyprpolkitagent

    # Execute startup.sh
    exec-once = ~/.config/hypr/scripts/startup.sh

    # Cursor
    exec-once = hyprctl setcursor Bibata-Modern-Ice 24

    # SwayOSD
    exec-once = swayosd-server
  '';
}
