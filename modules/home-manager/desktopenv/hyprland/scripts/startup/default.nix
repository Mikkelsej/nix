{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/scripts/startup.sh" = {
    source = ./startup.sh;
    executable = true;
  };
}
