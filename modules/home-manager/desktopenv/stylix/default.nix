{ config, pkgs, ... }:

{
  imports = [
    #inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    image = ./../../../../wallpapers/sundown-over-sea.jpg;
    base16Scheme = ./mytheme.yaml;
    polarity = "dark";
    targets = {

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
