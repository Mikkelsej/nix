{
  description = "NixOS config with integrated Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, stylix, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      hostnames = [ "slimbook" "galaxybook" ];

      mkHost = hostname: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs hostname;
        };
        modules = [
          ./hosts/${hostname}/configuration.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.default
          ({ config, ... }: {
            networking.hostName = hostname;
          })
        ];
      };
    in {
      nixosConfigurations = builtins.listToAttrs
        (map (name: { name = name; value = mkHost name; }) hostnames);
    };
}
