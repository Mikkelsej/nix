{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;  
    theme = "/nixos/modules/desktopenv/rofi/themes/nord.rasi";  

    # Extra Rofi settings
    extraConfig = {
      modi = "drun,run";  # Launcher modes
      show-icons = true;
      sidebar-mode = true;
      font = "JetBrainsMono Nerd Font 12";
      lines = 10;
      columns = 1;
      location = 0;  # Centered
      width = 50;
      padding = 10;
      fixed-num-lines = true;
      hide-scrollbar = true;
      bw = 0;
    };
  };
}
