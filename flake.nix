{
  description = "Vaskel's NixOS system configs.";

  inputs = {
    nixpkgs.
    url = "github:nixos/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  };

  outputs = { nixpkgs, home-manager, darwin, ... }@inputs:
    let
      hm =
        { system
        , specialArgs ? { }
        , name ? "austin"
        , home-directory ? "/home/austin"
        }:
        home-manager.lib.homeManagerConfiguration {
          modules = [
            ./home/home.nix
            inputs.nix-doom-emacs.hmModule
            ({ ... }: {
              home.username = name;
              home.homeDirectory = home-directory;
            })
          ];
          pkgs = import nixpkgs {
            config.allowUnfree = true;
            inherit system;
            overlays = [
              (import (builtins.fetchTarball {
                url = "https://github.com/nix-community/emacs-overlay/tarball/8b343d6fee8481e33e529bf988e61801ca3d1178";
                sha256 = "1b1rm46ax9440dsiz1sqz7kpqrqdk29mvn02y8v7bfandlsgs0b5";
              }))
            ];
          };

          extraSpecialArgs = specialArgs;
        };

      lib = nixpkgs.lib;
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

      homeConfigurations."austin@Austins-PC" = hm { system = "x86_64-linux"; };

      homeConfigurations."austin@artemis.lan" = hm {
        system = "aarch64-darwin";
        home-directory = "/Users/austin";
      };

      darwinConfigurations.artemis = import hosts/artemis.nix inputs;

      nixosConfigurations = {
        "Austins-PC" = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/pc ];
        };
      };
    };
}
