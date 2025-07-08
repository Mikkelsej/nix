{ config, pkgs, ... }:

{
  imports = [
    
  ];

  stylix = {
    enable = true;
    #image = ./../../../../wallpapers/sundown-over-sea.jpg;
    base16Scheme = ./mytheme.yaml;
    polarity = "dark";
    targets = {
      #waybar.enable = false;
      #kitty.enable = false;
      #rofi.enable = false;
      #neovim.enable = false;
    };


    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      serif = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      sansSerif = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
    };
  };
}
