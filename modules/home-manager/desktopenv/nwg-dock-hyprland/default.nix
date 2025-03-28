{ config, pkgs, ... }:


let
  dockStyle = import ./style.nix { inherit config pkgs; };
in

{
	programs.nwg-dock-hyprland = {
		enable = true;
		style = dockStyle.style;
	};
}
