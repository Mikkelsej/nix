{ config, pkgs, ... }:
{
    imports = [
      
    ];

    home.packages = with pkgs; [
      # Python
      python3Minimal

      # Java
      jdk
      
      # C
      gcc

      # Node.js
      nodejs-slim
    ];
}