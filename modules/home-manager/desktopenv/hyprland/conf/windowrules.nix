{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/conf/windowrules.conf".text = ''
# nmtui
    windowrulev2 = float, title:^(Network Manager)$
    windowrulev2 = center, title:^(Network Manager)$
    windowrulev2 = movecursor, title:^(Network Manager)$
    windowrulev2 = stayfocused, title:^(Network Manager)$
# pavucontrol
    windowrulev2 = float, title:^(Volume Control)$
    windowrulev2 = center, title:^(Volume Control)$
    windowrulev2 = movecursor, title:^(Volume Controls)$
    windowrulev2 = stayfocused, title:^(Volume Control)$
# blueman-manager
    windowrulev2 = float, title:^(Bluetooth Devices)$
    windowrulev2 = center, title:^(Bluetooth Devices)$
    windowrulev2 = movecursor, title:^(Bluetooth Devices)$
    windowrulev2 = stayfocused, title:^(Bluetooth Devices)$
  '';
}