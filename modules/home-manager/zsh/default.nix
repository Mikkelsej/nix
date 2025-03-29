{ config, pkgs, ... }:


let
  zshAliases = import ./aliases.nix { inherit config pkgs; };
in

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
    shellAliases = zshAliases.shellAliases;
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
