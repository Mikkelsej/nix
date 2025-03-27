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
  boot.initrd.luks.devices."luks-dd50b3c2-cab3-475c-b3cd-f4e74f59aeeb".device = "/dev/disk/by-uuid/dd50b3c2-cab3-475c-b3cd-f4e74f59aeeb";

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
    vscode
    kitty
    wget
    git
    firefox
    hyprland
    hypridle
    hyprlock
    hyprpaper
    hyprpolkitagent
    waybar
    waypaper
    nautilus
    nautilus-open-any-terminal
    swaynotificationcenter
    rofi
    oh-my-posh
    fastfetch
    eza
    nwg-dock-hyprland
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
  ];
  
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  
  services.blueman.enable = true;

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
  };

  # Automatic system upgrade and garbage collection
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 10d";
  };

  nix.settings.auto-optimise-store = true;

  # Optional: Enable OpenSSH if needed
  # services.openssh.enable = true;

  # Set state version (important for NixOS upgrades)
  system.stateVersion = "24.11";  # Ensure you're using the correct state version
}
