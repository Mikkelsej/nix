{ config, pkgs, ... }:
{
    imports = [
        # Statusbar
        ./../waybar/default.nix

        # Style
        ./../fastfetch.nix

        # Docker
        ./../nwg-dock-hyprland.nix

        # Configuration settings
        ./conf/monitor.nix
        ./conf/windowrules.nix
        ./conf/defaultapplications.nix
        ./conf/decorations.nix
        ./conf/autostart.nix
        ./conf/animations.nix
        ./conf/keybindings.nix

        # hyprland
        ./hyprland.nix

        # Scripts
        ./scripts/startup.nix

        # Wallpaper
        ./hyprpaper.nix
        #./../pywal.nix

        # Application Launcher
        ./../rofi.nix
        
        # File manager
        #./../nautilus.nix

        # Terminal
        ./../kitty.nix

        # Shell
        ./../zsh/default.nix

        # Not implemented yet
        #./scripts/screenshot.nix
    ];
}