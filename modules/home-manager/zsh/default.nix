{ config, pkgs, ... }:

{
  # Enable Zsh shell
  programs.zsh = {
    enable = true;
		enableCompletion = true;
		syntaxHighlighting.enable = true;
		autosuggestion.enable = true;

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

    # Aliases
    shellAliases = {
      c = "clear";
      nf = "fastfetch";
      pf = "fastfetch";
      ff = "fastfetch";
      ls = "eza -a --icons=always";
      ll = "eza -al --icons=always";
      lt = "eza -a --tree --level=1 --icons=always";
      shutdown = "systemctl poweroff";
      v = "$EDITOR";
      vim = "$EDITOR";

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

      update-grub = "sudo grub-mkconfig -o /boot/grub/grub.cfg";
      update-flake = "sudo nixos-rebuild switch --flake nixos/#nixos";
    };
    initExtra = ''
      # Check if we are on tty1, then start Hyprland
      if [[ "$(tty)" == "/dev/tty1" ]]; then
        exec Hyprland
      fi

      # Check if terminal is a pseudo-terminal (pts)
      if [[ $(tty) == *"pts"* ]]; then
        # Run fastfetch with the specified config
        fastfetch --config examples/13
      fi
      export ZSH="${pkgs.zsh}/bin/zsh"
      export ZSH_HIGHLIGHT_STYLES='bg=blue'
      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'
    '';
  };

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  # Enable Home Manager to manage the user's home environment
  programs.home-manager.enable = true;
}
