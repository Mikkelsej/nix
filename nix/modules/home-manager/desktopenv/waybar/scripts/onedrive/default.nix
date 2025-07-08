{ config, pkgs, ... }:

{
  home.file.".config/waybar/scripts/onedrive.sh" = {
    source = ./onedrive.sh;
    executable = true;
  };

  # Ensure dependencies are installed
  home.packages = with pkgs; [
    procps # for pgrep
    onedrive
  ];
}
