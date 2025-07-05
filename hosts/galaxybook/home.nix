{ config, pkgs, ... }:

{
  home.username = "mikke";
  home.homeDirectory = "/home/mikke";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Code Editor
    vscode
    jetbrains.idea-ultimate

    waypaper
    
    # Notification Daemon
    swaynotificationcenter
    # Application Launcher
    rofi-wayland
  
    
    # Screenshots    
    grim
    slurp
    grimblast
    # Terminal & more
    fastfetch
    eza
    kitty
    # Shell 
    zsh
    
    discord
    spotify
    spotify-tray
    obsidian

    gparted

    networkmanagerapplet

    mako
    libnotify
    swayosd
    
    xpad

    yazi
    
    onedrive

    tree-sitter
  ];

  services.swayosd = {
    enable = true;
  };

  home.file = {

  };

  fonts = {

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrains Mono" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
  };

  home.sessionVariables = {
    EDTOR = "code";
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;

  

  imports = [
   ./../../modules/home-manager/common.nix
  ];
}
