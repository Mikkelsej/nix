{ config, pkgs, ... }:

{
    programs.gtk = {
        enable = true;
        cursorTheme.package = pkgs.bibata-cursors;
        cursorTheme.name = "Bibata-Modern-Ice";
    };
}