{ config, pkgs, ... }:


{

  home.file.".config/nvim/init.lua".source = ./init.lua;

  home.file.".config/nvim/lua/lazy-bootstrap.lua".source = ./lua/lazy-bootstrap.lua;


  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = "";
  };
}