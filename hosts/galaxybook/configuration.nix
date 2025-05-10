{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default  # Import Home Manager module
      
    ];

  # Bootloader setup
  boot.loader = {
    efi.canTouchEfiVariables = true;
    timeout = null;
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      device = "nodev";
      extraEntries = ''
        menuentry "Reboot into UEFI Firmware Settings" {
          fwsetup
        }
      '';
      backgroundColor = lib.mkForce "#000000";
      default = "3";
      theme = ./../../modules/nixos/grub-themes/Particle/theme.txt;
    };
  };

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
    extraGroups = [ "networkmanager" "wheel" "input" "video" "audio" "docker" ];
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


    gnumake
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
    backupFileExtension = "backup";
  };

  # Automatic system upgrade and garbage collection
  system.autoUpgrade = {
    enable = true;
    dates = "daily";
  };
  

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  #stylix = {
  #  enable = true;
  #  image = ./../../wallpapers/sundown-over-sea.jpg;
  #  base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";    
  #  polarity = "dark";
  #  targets = {
  #    
  #  };
  #  fonts = {
  #    monospace = {
  #      package = pkgs.jetbrains-mono;
  #      name = "JetBrains Mono";
  #    };
  #
  #    serif = {
  #      package = pkgs.jetbrains-mono;
  #      name = "JetBrains Mono";
  #    };
  #
  #    sansSerif = {
  #      package = pkgs.jetbrains-mono;
  #      name = "JetBrains Mono";
  #    };
  #
  #    emoji = {
  #      package = pkgs.noto-fonts-emoji;
  #      name = "Noto Emoji";
  #    };
  #  };
  #};

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    ];
  };


  boot.consoleLogLevel = 0;  
  boot.kernelParams = [ "quiet" "loglevel=0" ];  
  boot.initrd.verbose = false;
  boot.plymouth.enable = true;


  services.xserver = {
    enable = true;
    displayManager.lightdm = {
      enable = true;
      greeters.enso.enable = true;
    };
  };

  #services.displayManager.autoLogin = {
  #  enable = true;
  #  user = "mikke";
  #};

  # Enable docker
  #virtualisation.docker.enable = true;


  #virtualisation.oci-containers = {
  #  containers = {
  #    fittrackee = {
  #      image = "samr1/fittrackee:latest";
  #      ports = [ "5000:5000" ];
  #      environment = {
  #        UI_URL = "http://localhost:5000";
  #        DATABASE_URL = "postgresql://#fittrackee:password@db/fittrackee";
  #      };
  #    };

  #    db = {
  #      image = "postgres:15";
  #      ports = [ "5432:5432" ];
  #      environment = {
  #        POSTGRES_DB = "fittrackee";
  #        POSTGRES_USER = "fittrackee";
  #        POSTGRES_PASSWORD = "password";
  #      };
  #    };

  #    ui = {
  #      image = "samr1/fittrackee-ui:latest";
  #      ports = [ "3000:80" ];
  #    };
  #  };
  #};


  # Optional: Enable OpenSSH if needed
  # services.openssh.enable = true;

  # Set state version (important for NixOS upgrades)
  system.stateVersion = "24.11";  # Ensure you're using the correct state version
}
