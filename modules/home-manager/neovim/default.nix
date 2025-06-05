{ config, pkgs, ... }:


{

  home.file.".config/nvim".source = ./neovim-config/;
  home.file.".config/nvim".recursive = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = "";
  };
}