{
  description = "Vaskel's NixOS system configs.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, darwin, ... }@inputs:
    let
      hm = { system, specialArgs ? { }, name ? "austin"
        , home-directory ? "/home/austin" }:
        home-manager.lib.homeManagerConfiguration {
          modules = [
            ./home/home.nix
            ({ ... }: {
              home.username = name;
              home.homeDirectory = home-directory;
            })
          ];
          pkgs = import nixpkgs {
            config.allowUnfree = true;
            inherit system;
          };

          extraSpecialArgs = specialArgs;
        };

      lib = nixpkgs.lib;
    in {
      homeConfigurations."austin@nixos-wsl" = hm { system = "x86_64-linux"; };

      homeConfigurations."austin@artemis.lan" = hm {
        system = "aarch64-darwin";
        home-directory = "/Users/austin";
      };

      darwinConfigurations.artemis =  import hosts/artemis.nix inputs;

      nixosConfigurations = {
        nixos-wsl = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/nixos-wsl ];
        };
      };
    };
}
