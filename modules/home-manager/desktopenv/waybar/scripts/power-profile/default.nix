{ config, pkgs, ... }:

{
  home.file.".config/waybar/scripts/power-profile.sh" = {
    source = ./power-profile.sh;
    executable = true;
  };
}
