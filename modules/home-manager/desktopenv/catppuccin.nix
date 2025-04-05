{ config, lib, pkgs, catppuccin, ... }:

{
  programs.catppuccin = {
    enable = true;
    flavor = "mocha";
  };
}