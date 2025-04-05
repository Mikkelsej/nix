{ config, pkgs, ... }:

{
  # Enable Nautilus as a file manager
  programs.nautilus = {
    enable = true;
  };

  # Ensure GVfs is enabled for full functionality
  services.gvfs.enable = true;

  # Enable the necessary GStreamer plugins for audio/video properties
  nixpkgs.overlays = [
    (final: prev: {
      nautilus = prev.nautilus.overrideAttrs (nprev: {
        buildInputs = nprev.buildInputs ++ (with pkgs.gst_all_1; [
          gst-plugins-good
          gst-plugins-bad
        ]);
      });
    })
  ];

  # Add support for HEIC image preview in Nautilus
  home.packages = [
    pkgs.libheif
    pkgs.libheif.out
  ];

  # Link thumbnailers for preview support
  home.file = {
    ".config/thumbnailers" = {
      source = "/nix/store/..."; # Ensure to link thumbnailers path here if needed.
    };
  };
}
