{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/conf/defaultapplications.conf".text = ''
# Save defualt applications to a variable

$terminal = kitty

$filemanager = nautilus

$menu = rofi -show drun

$browser = firefox

$HOME = ~/home/mikke

  '';
}