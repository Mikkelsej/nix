{ config, pkgs, ... }:

{
  services = {
    displayManager = {
      defaultSession = "hyprland";
      autoLogin = {
          enable = true;
          user = "mikke";
        };
    }
    xserver = {
      enable = true;
      displayManager = {
        lightdm = {
          enable = true;
          greeters.enso = {
            enable = true;
          };
        background = "/etc/sundown-over-sea.jpg";    
        };
      };
    };
  };
  
  environment.etc."sundown-over-sea.jpg".source = ./../../../wallpapers/sundown-over-sea.jpg;
}