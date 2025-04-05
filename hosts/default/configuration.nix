{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default  # Import Home Manager module
    ];

  # Bootloader setup
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-24dfd462-9c09-43df-b732-ce695d5640b7".device = "/dev/disk/by-uuid/24dfd462-9c09-43df-b732-ce695d5640b7";

  networking.hostName = "nixos"; # Define hostname
  networking.networkmanager.enable = true;  # Enable NetworkManager

  # Set the timezone and locale
  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_DK.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  console.keyMap = "dk-latin1"; # Set keymap

  # Enable CUPS for printing
  services.printing.enable = true;

  # Sound configuration with Pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # User configuration for 'mikke'
  users.users.mikke = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "mikke";
    extraGroups = [ "networkmanager" "wheel" "input" "video" "audio" ];
    packages = with pkgs; [
      # Add any user-specific packages here
    ];
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

  # Link thumbnailers for preview support
  environment.pathsToLink = [ "share/thumbnailers" ];

  # Enable Zsh for user
  programs.zsh.enable = true;

  # Enable automatic login
  services.getty.autologinUser = "mikke";

  # Hyprland configuration (Wayland compositor)
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Allow unfree packages (for example, proprietary drivers)
  nixpkgs.config.allowUnfree = true;

  # Installed system-wide packages
  environment.systemPackages = with pkgs; [
    vim
    
    
    wget
    git
    firefox
    
    nautilus
    nautilus-open-any-terminal
    
    pipewire
    pavucontrol
    wireplumber
    bluez
    blueman
    pywal
    brightnessctl # For brigtness keybinding
    pulseaudio # For Volume Keybinding
    playerctl # For Volume Control
    nerd-fonts.agave
    breeze-hacked-cursor-theme
    capitaine-cursors
    bibata-cursors
    gtk4
    pinta

    home-manager
    # Add support for HEIC image preview in Nautilus
    pkgs.libheif
    pkgs.libheif.out   

    catppuccin
  ];
  
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  
  services.blueman.enable = true;

  
  
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    ];
  };

  

  # Enable xdg portal for Wayland
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Enable Home Manager configuration for user 'mikke'
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      mikke = import ./home.nix;  # Import user-specific home manager config
    };
    backupFileExtension = "backup";
  };

  # Automatic system upgrade and garbage collection
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Optional: Enable OpenSSH if needed
  # services.openssh.enable = true;

  # Set state version (important for NixOS upgrades)
  system.stateVersion = "24.11";  # Ensure you're using the correct state version
}
