{ config, pkgs, ... }:


{

  home.file.".config/nvim".source = ./nvim-config;
  home.file.".config/nvim".recursive = true;

  programs.neovim = {
    enable = true;
    extraConfig = "";
  };

  home.packages = with pkgs; [
    ripgrep # Needed for telescope
    gcc # Needed for telescope
    tree-sitter
    nixd
  ];
}
