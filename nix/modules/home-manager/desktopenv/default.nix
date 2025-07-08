{ config, pkgs, ... }:

{
  imports = [
    # hyprland
    ./hyprland/default.nix

    # Statusbar
    ./waybar/default.nix
    ./waybar/scripts/onedrive/default.nix
    ./waybar/scripts/power-profile/default.nix

    # Terminal and more
    ./fastfetch.nix
    ./kitty.nix

    # Menu
    ./rofi/default.nix

    # themes
    ./themes/default.nix

    # Desktop apps
    ./apps.nix
  ];

  home.packages = with pkgs; [
    # Notification daemons
    mako
    libnotify
  ];
}