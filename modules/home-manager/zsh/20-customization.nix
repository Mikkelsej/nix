{ config, pkgs, ... }:

let
  ohMyPosh = pkgs.fetchurl {
    url = "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v16.7.0/posh-linux-amd64";
    sha256 = "0gkjg5xq2jvjp64rxpyy5av5g5b2f9c8kvy8pgkmqhbldg6b2pc5";
  };
in
''
  # Custom Prompt with Oh My Posh
  export POSH="${ohMyPosh}"
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/EDM115-newline.omp.json)"

  # History and prompt settings
  export HISTSIZE=10000
  export SAVEHIST=10000
  export HISTFILE=~/.zsh_history
''
