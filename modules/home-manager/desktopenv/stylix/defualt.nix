{ config, pkgs, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    base16Scheme = ./mytheme.yaml;
    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sizes = {
        applications = 12;
        terminal = 12;
      };
    };
    cursor = {
      color = "fed893";
    };
  };
}
