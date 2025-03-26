{ config, pkgs, ... }:

{
  initExtra = ''
    export ZSH="${pkgs.zsh}/bin/zsh"
    export ZSH_HIGHLIGHT_STYLES='bg=blue'
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'
  '';
  
  initContent = ''
    # Custom Zsh initialization code
    # Example: Setting up prompt, environment variables, etc.
    export PATH=$PATH:$HOME/bin
  '';
  
  # Shell script to source configuration files
  extraShellConfig = ''
    for f in ~/.config/zshrc/*; do 
      if [ ! -d "$f" ]; then
        c="${f//.config\/zshrc/.config\/zshrc\/custom}"
        [[ -f $c ]] && source $c || source $f
      fi
    done
  '';
}
