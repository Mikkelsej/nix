{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    configure = {
      customRC = ''
        ${lua "lazy-bootstrap.lua"}
      '';

      packages.myVimPackage = with pkgs.vimPlugins; {

      };
    }
  };
}