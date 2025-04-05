
{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/hyprland.conf".text = ''

#  _   _                  _                 _
# | | | |_   _ _ __  _ __| | __ _ _ __   __| |
# | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
# |  _  | |_| | |_) | |  | | (_| | | | | (_| |
# |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
#        |___/|_|
#
# -----------------------------------------------------
# IMPORTANT: Don't overwrite ML4W configuration.
# Create your own custom configuration variation instead.
# https://github.com/mylinuxforwork/dotfiles/wiki/Configuration-Variations

# -----------------------------------------------------
# Defaults
# -----------------------------------------------------
source = ~/.config/hypr/conf/defaultapplications.conf

# -----------------------------------------------------
# Monitor
# -----------------------------------------------------
source = ~/.config/hypr/conf/monitor.conf

# -----------------------------------------------------
# Autostart
# -----------------------------------------------------
source = ~/.config/hypr/conf/autostart.conf

# -----------------------------------------------------
# Load configuration files
# -----------------------------------------------------

source = ~/.config/hypr/conf/decorations.conf
source = ~/.config/hypr/conf/keybindings.conf
source = ~/.config/hypr/conf/windowrules.conf

# -----------------------------------------------------
# Animation
# -----------------------------------------------------
source = ~/.config/hypr/conf/animations.conf

env = XCURSOR_SIZE,24
env = HYPRCURSOR_SIZE,24

general {
    gaps_in = 5
    gaps_out = 20

    border_size = 2

    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    # Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = false

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false

    layout = dwindle
}

dwindle {
    pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # You probably want this
}

# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
master {
    new_status = master
}

# https://wiki.hyprland.org/Configuring/Variables/#misc
misc {
    force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = false # If true disables the random hyprland logo / anime girl background. :(
}

input {
    kb_layout = dk
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

    touchpad {
        natural_scroll = true
    }
}

  '';
}



