{ config, pkgs, ... }:
{
    imports = [
        ./../waybar/default.nix
        ./../fastfetch.nix
        ./../pywal.nix
        ./conf/monitor.nix
        ./conf/windowrules.nix
        ./conf/defaultapplications.nix
        ./conf/decorations.nix
        ./conf/autostart.nix
        ./conf/animations.nix
        ./conf/keybindings.nix
        ./hyprpaper.nix
        ./scripts/startup.nix
        ./../rofi.nix
        ./../nautilus.nix
        #./scripts/screenshot.nix
    ];

    pywal.enable = false;
}