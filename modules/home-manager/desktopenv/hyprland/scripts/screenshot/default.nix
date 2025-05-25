{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/scripts/screenshot.sh" = {
    source = ./screenshot.sh;
    executable = true;
  };
}
