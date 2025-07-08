{ config, pkgs, hostname, ... }:

{
    shellAliases = {
      c = "clear";
      nf = "fastfetch";
      pf = "fastfetch";
      ff = "fastfetch";
      ls = "eza -a --icons=always";
      ll = "eza -al --icons=always";
      lt = "eza -a --tree --level=1 --icons=always";
      shutdown = "systemctl poweroff";

      wifi = "nmtui";
      logout = "hyprctl dispatch exit";

      gs = "git status";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gst = "git stash";
      gsp = "git stash; git pull";
      gfo = "git fetch origin";
      gcheck = "git checkout";
      gcredential = "git config credential.helper store";

      switch-flake="sudo nixos-rebuild switch --flake 'path:/home/mikke/nix/#${hostname}'";

      home-switch = "home-manager switch --flake ~/nix#${hostname}";
      update-flake = "nix flake update --flake 'path:/home/mikke/nix' && switch-flake";
    };
}