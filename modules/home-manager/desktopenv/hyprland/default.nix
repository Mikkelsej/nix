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
        ./scripts/startup/default.nix
        ./scripts/screenshot/default.nix

        # Wallpaper
        ./hyprpaper.nix
        

        # theme

        
        
        

        # Terminal
        ./../kitty.nix

        # Shell
        ./../zsh/default.nix

        # Not implemented yet
        
        #./../pywal.nix

        # File manager
        #./../nautilus.nix

        # Application Launcher
        #./../rofi.nix
    ];
}