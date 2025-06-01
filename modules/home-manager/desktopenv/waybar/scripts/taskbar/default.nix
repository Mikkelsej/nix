{ config, pkgs, ... }:

let
  TaskbarScript = ''
    #!/bin/bash

    apps=""

    if pgrep -x "discord" > /dev/null; then
      apps+=" "
    fi

    if pgrep -x "spotify" > /dev/null; then
      apps+=" "
    fi

    if pgrep -x "onedrive" > /dev/null; then
      apps+=" "
    fi

    echo "$apps"
  '';
in {
  home.file.".config/waybar/scripts/taskbar.sh" = {
    text = TaskbarScript;
    executable = true;
  };

  # Ensure dependencies are installed
  home.packages = with pkgs; [
    procps # for pgrep
  ];
}
