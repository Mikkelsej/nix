{ config, pkgs, ... }:


{
  # Automatic system upgrade and garbage collection
  system.autoUpgrade = {
    enable = true;
    dates = "daily";
  };

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    settings = {
      auto-optimise-store = true;
    };
    };
}    