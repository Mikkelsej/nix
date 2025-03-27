{ config, pkgs, ... }:

# Import the custom colors from wal
let
  walColors = pkgs.runCommand "wal-colors" { } ''
    cp ${config.home.file.".cache/wal/colors-waybar.css"} $out
  '';
in

''
  @import url('${walColors}/colors-waybar.css');

  * {
    font-size: 15px;
    font-family: "CodeNewRoman Nerd Font Propo";
  }

  window#waybar {
    all: unset;
  }

  .modules-left {
    padding: 7px;
    margin: 10 0 5 10;
    border-radius: 10px;
    background: alpha(@background, .6);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
  }

  .modules-center {
    padding: 7px;
    margin: 10 0 5 0;
    border-radius: 10px;
    background: alpha(@background, .6);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
  }

  .modules-right {
    padding: 7px;
    margin: 10 10 5 0;
    border-radius: 10px;
    background: alpha(@background, .6);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
  }

  tooltip {
    background: @background;
    color: @color7;
  }

  #clock:hover,
  #custom-pacman:hover,
  #custom-notification:hover,
  #bluetooth:hover,
  #network:hover,
  #battery:hover,
  #cpu:hover,
  #memory:hover,
  #temperature:hover {
    transition: all .3s ease;
    color: @color9;
  }

  #battery {
    padding: 0px 5px;
    transition: all .3s ease;
    color: @color7;
  }

  #battery.charging {
    color: #26A65B;
  }

  #battery.warning:not(.charging) {
    color: #ffbe61;
  }

  #battery.critical:not(.charging) {
    color: #f53c3c;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }

  @keyframes blink {
    to { background-color: #ffffff; color: #000000; }
  }

  #cpu,
  #memory,
  #temperature {
    padding: 0px 5px;
    transition: all .3s ease;
    color: @color7;
  }

  #tray {
    padding: 0px 5px;
    transition: all .3s ease;
  }

  #tray menu * {
    padding: 0px 5px;
    transition: all .3s ease;
  }

  #tray menu separator {
    padding: 0px 5px;
    transition: all .3s ease;
  }
''
