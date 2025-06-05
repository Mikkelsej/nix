{ config, pkgs, ... }:

{
  imports = [ 
    ./programming_languages/default.nix
    ./git.nix
    ./desktopenv/hyprland/default.nix
    ./desktopenv/stylix/default.nix
    ./neovim/default.nix
  ];
} 