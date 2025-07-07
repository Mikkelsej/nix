{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        autoLogin = {
          enable = true;
          user = "mikke";
        };
        
        defaultSession = "hyprland";

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