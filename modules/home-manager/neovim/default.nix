{ config, pkgs, ... }:

let 
  lua = name: builtins.readFile ./lazy-bootstrap.lua;
in
  {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      
      plugins = [ ];

      extraConfig = 
        ''
        ${lua "lazy-bootstrap.lua"}
        '';
    };
  }