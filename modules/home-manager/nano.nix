{ config, pkgs, ... }:

{
	programs.nano = {
		enable = true;
		extraConfig = ''
			set tabsize 2
		'';
	};
}
