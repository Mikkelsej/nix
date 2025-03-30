{ config, pkgs, ... }:

{
  home.username = "mikke";
  home.homeDirectory = "/home/mikke";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Code Editor
    vscode
    # hyprland & more
    hyprland
    hypridle
    hyprlock
    hyprpolkitagent
    # Status bar
    waybar
    # Wallpaper
    waypaper
    hyprpaper
    # Notification Daemon
    swaynotificationcenter
    # Application Launcher
    rofi-wayland
    # Docker
    nwg-dock-hyprland
    # Screenshots    
    grim
    slurp
    grimblast
    # Terminal & more
    oh-my-posh
    fastfetch
    eza
    kitty
    # Shell 
    zsh
  ];


  home.file = {

  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrains Mono" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
  };

  home.sessionVariables = {
    EDTOR = "nvim";
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;

  # Enable Docker
  programs.nwg-dock-hyprland.enable = true;

  imports = [
    ./../../modules/home-manager/kitty.nix
    ./../../modules/home-manager/zsh/default.nix
    ./../../modules/home-manager/git.nix
    ./../../modules/home-manager/rofi.nix
    #./../../modules/home-manager/desktopenv/waybar/default.nix
    ./../../modules/home-manager/desktopenv/nwg-dock-hyprland.nix
    ./../../modules/home-manager/desktopenv/hyprland/default.nix
    #./../../modules/home-manager/gtk.nix
    #./../../modules/nixos/nautilus.nix
  ];
}
