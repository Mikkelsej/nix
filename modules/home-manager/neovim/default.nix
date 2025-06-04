{ config, pkgs, ... }:


{

  home.file.".config/nvim/init.lua".source = ./init.lua;

  home.file.".config/nvim/lua/lazy-bootstrap.lua".source = ./lua/lazy-bootstrap.lua;

  home.file.".config/nvim/lua/plugins.lua".source = ./lua/plugins.lua;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = "";
  };
}