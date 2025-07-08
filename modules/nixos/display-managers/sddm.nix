{ config, pkgs, ... }:

{
  services = {
    displayManager.sddm = {
      enable = true;
      theme = "breeze";
      wayland.enable = true;
      settings = {
        Theme = {
          Background = "/etc/sundown-over-sea.jpg";
        };
        General = {
          Locale = "da_DK.UTF-8";
          TimeZone = "Europe/Copenhagen";
          GreeterEnvironment = "TZ=Europe/Copenhagen";   
          Background = "/etc/sundown-over-sea.jpg";       
        };
      };
    };
  };
}