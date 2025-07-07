{
  description = "Unified NixOS and Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Optional: other inputs like flake-parts, nix-colors, etc.
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      hostnames = [ "slimbook" "galaxybook" ];

      mkHost = hostname: nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs hostname;
        };

        modules = [
          ./hosts/${hostname}/configuration.nix
          home-manager.nixosModules.default
        ];
      };
    in {
      # For NixOS systems
      nixosConfigurations = builtins.listToAttrs
        (map (name: { name = name; value = mkHost name; }) hostnames);

      # For standalone Home Manager (e.g., WSL, non-NixOS)
      homeConfigurations = {
        mikke = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home.nix
            ./modules/zsh/default.nix
            ./modules/git.nix
            ./modules/yazi.nix
          ];

          # Optional: pass args to modules
          extraSpecialArgs = {
            inherit inputs;
          };
        };
      };
    };
}
