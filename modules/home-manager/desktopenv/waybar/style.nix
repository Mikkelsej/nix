{ config, pkgs, ... }:

{
    style = 
        ''
* {
    font-size: 16px;
    font-family: "JetBrainsMono Nerd Font", "monospace";
}

window#waybar {
    all: unset;
}

.modules-left {
    padding:7px;
    margin:10 0 5 10;
    border-radius:10px;
    background: alpha(#0A0B0F,.6);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
}
.modules-center {
    padding:7px;
    margin:10 0 5 10;
    border-radius:10px;
    background: alpha(#0A0B0F,.6);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
}
.modules-right {
    padding: 7px;
    margin: 10px 0 5px 10px;
    border-radius: 10px;
    background: alpha(#0A0B0F, .6);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
}

tooltip {
    background: #0A0B0F;
    color: #e1cdbf;
}

/* Default: Icons inherit background and color is neutral */
#clock,
#custom-pacman,
#custom-notification,
#bluetooth,
#network,
#battery,
#cpu,
#pulseaudio,
#memory,
#temperature {
    color: white; /* Light color for icons */
    background: inherit;  /* No background */
    transition: all .3s ease;
}

/* Hover effect: Show blue color when hovering */
#custom-pacman:hover,
#custom-notification:hover,
#bluetooth:hover,
#network:hover,
#battery:hover,
#cpu:hover,
#pulseaudio:hover,
#memory:hover,
#temperature:hover {
    color: #1E90FF;  /* Change to blue on hover */
    background: white; /* Ensure background remains unchanged */
}
#clock:hover {
    color: #1E90FF;
}
#battery {
    padding: 0px 5px;
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
    color: rgba(255, 255, 255, 0.6); /* Light color */
    transition: all .3s ease;
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

#workspaces {
    padding: 0px 5px;
}
#workspaces button {
    all:unset;
    padding: 0px 5px;
    color: rgba(30, 144, 255, 0.6);
    transition: all .2s ease;
}
#workspaces button:hover {
    color: rgba(30, 144, 255, 0.6);
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
    transition: all 1s ease;
    background: white;
}
#workspaces button.active {
    color: #1E90FF;
    border: none;
    text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
}
#workspaces button.empty {
    color: white;
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
}
#workspaces button.empty:hover {
    color: rgba(30, 144, 255, 0.4);
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
    transition: all 1s ease;
    background: white;
}
#workspaces button.empty.active {
    color: #1E90FF;
    border: none;
    text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
}

    '';
}
