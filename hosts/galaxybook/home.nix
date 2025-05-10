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
    
    discord
    spotify
    obsidian

    gparted

    networkmanagerapplet

    #starship

    mako
    libnotify
    swayosd
    

    fittrackee
    postgresql
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

  # Enable Docker
  programs.nwg-dock-hyprland.enable = true;

  stylix.targets = {
    waybar.enable = false;
    kitty.enable = false;
    rofi.enable = true;
  };
  
  #programs.starship = {
  #  enable = true;
  #  settings = {
  #    add_newline = true;
  #    command_timeout = 1300;
  #    scan_timeout = 50;
  #    format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
  #    character = {
  #      success_symbol = "[](bold green) ";
  #      error_symbol = "[✗](bold red) ";
  #    };
  #  };
  #};

  imports = [
    ./../../modules/home-manager/programming_languages/default.nix
    ./../../modules/home-manager/git.nix
    ./../../modules/home-manager/desktopenv/hyprland/default.nix
    #./../../modules/home-manager/gtk.nix
    ./../../modules/home-manager/desktopenv/stylix/default.nix
  ];
}
