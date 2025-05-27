{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/scripts/screenshot.sh" = {
    source = ./screenshot1.sh;
    executable = true;
  };
}
