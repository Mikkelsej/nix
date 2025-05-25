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
    padding: 0;
    margin: 0;
    border-radius:10px;
    background: alpha(#0A0B0F,.0);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .0);
}

.modules-right {
    padding: 0;
    margin: 0;
    border-radius: 10px;
    background: alpha(#0A0B0F, .0);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .0);
}

tooltip {
    background: #0A0B0F;
    color: #e1cdbf;
}

/* Default: Icons inherit background and color is neutral */
#clock,
#custom-notification,
#bluetooth,
#network,
#battery,
#cpu,
#pulseaudio,
#memory,
#tray,
#temperature {
    color: white; /* Light color for icons */
    transition: all .3s ease;
    background: alpha(#0A0B0F, .6);
    border-radius: 10px;
    margin: 2px;
}

/* Hover effect: Show blue color when hovering */
#custom-notification:hover,
#bluetooth:hover,
#network:hover,
#battery:hover,
#cpu:hover,
#pulseaudio:hover,
#memory:hover,
#temperature:hover {
    color: #1E90FF;  /* Change to blue on hover */
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
    color: rgba(255, 255, 255, 0.6); /* Light color */
    transition: all .3s ease;
}

#tray menu * {
    padding: 0px;
    transition: all .3s ease;
}

#tray menu separator {
    padding: 0;
    transition: all .3s ease;
}

#workspaces {
    padding: 0px 5px;
    background: alpha(#0A0B0F, .6);
    border-radius: 10px;
    margin: 5px;
}

#workspaces button {
    transition: all 0.3s ease-in-out;
    opacity: 0.6;
    all: unset;
    padding: 5px 10px;
    
}

#workspaces button:hover {
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
    transition: all 1s ease;
}

#workspaces button.active {
    transition: all 0.3s ease-in-out;
    opacity: 1;
    border: none;
    text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
    background: alpha(#1E90FF, 0.3);
    border-radius:10px;
}

#workspaces button.empty {
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
}

#workspaces button.empty:hover {
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
    transition: all 1s ease;
}

#workspaces button.empty.active {
    border: none;
    text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
}

    '';
}
