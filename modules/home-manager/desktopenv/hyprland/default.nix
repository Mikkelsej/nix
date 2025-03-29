{ config, pkgs, ... }:
{
    imports = [
        ./conf/monitor.nix
        ./conf/windowrules.nix
        ./conf/defaultapplications.nix
        ./conf/decorations.nix
        ./scripts/startup.nix
        #./scripts/screenshot.nix
    ];
}