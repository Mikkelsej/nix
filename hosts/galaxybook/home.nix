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
  ];

  services.swayosd = {
    enable = true;
  };

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

  # Enable Dock for hyprland
  programs.nwg-dock-hyprland.enable = true;

  imports = [
    ./../../modules/home-manager/programming_languages/default.nix
    ./../../modules/home-manager/git.nix
    ./../../modules/home-manager/desktopenv/hyprland/default.nix
    ./../../modules/home-manager/desktopenv/stylix/default.nix
    ./../../modules/home-manager/neovim/default.nix
  ];
}
