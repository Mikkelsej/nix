{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "MikkelSej";
    userEmail = "mikkel.sejdelin@gmail.com";
  };
}
