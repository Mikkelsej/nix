{ config, pkgs, ... }:

{
  home.username = "mikke";
  home.homeDirectory = "/home/mikke";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    vscode
    jetbrains.idea-ultimate
    discord
    spotify
    obsidian


    

    gparted

    mako
    libnotify
    
    
    xpad

    yazi
  ];

  

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
