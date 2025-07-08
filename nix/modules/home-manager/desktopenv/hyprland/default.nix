{ config, pkgs, ... }:
{
    imports = [
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

        # Dock
        ./nwg-dock-hyprland.nix
    ];


    services.swayosd = {
        enable = true;
    };

    # Enable Dock for hyprland
    programs.nwg-dock-hyprland.enable = true;

    home.packages = with pkgs; [
        hyprland
        hypridle
        hyprlock
        hyprpolkitagent
        hyprpaper

        waybar

        nwg-dock-hyprland
    ];
}