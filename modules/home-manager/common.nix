{ config, pkgs, ... }:

{
  imports = [ 
    ./programming_languages/default.nix
    ./git.nix
    ./desktopenv/hyprland/default.nix
    ./neovim/default.nix
    ./themes/default.nix
  ];
} 
