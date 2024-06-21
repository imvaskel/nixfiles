{
  description = "My home-manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nixgl,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [nixgl.overlay];
    };
    inherit (pkgs) lib;
    commonImports = [
      (lib.fileset.toList ./home/modules)
      (lib.fileset.toList ./home/common)
    ];
  in {
    homeConfigurations."skylar" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = lib.flatten [
        ./home/skylar.nix
        commonImports
      ];

      extraSpecialArgs = let
        name = "skylar";
        home = "/home/${name}";
      in {
        user = {
          inherit name home system;
        };
        inherit inputs;
        flakePath = "${home}/nixfiles";
      };
    };

    formatter.${system} = pkgs.alejandra;
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra # formatter
        nil # LSP
        statix # Lints
        # Applies some patches to allow passing --extra-experimental-features
        (pkgs.nix-prefetch.overrideAttrs (old: {
          patches =
            old.patches
            ++ [
              (fetchpatch {
                name = "msteen-nix-prefetch-pull-34.patch";
                url = "https://github.com/msteen/nix-prefetch/pull/34/commits/c5744efd558ba1dd3db7c2bc2152511556d4454a.patch";
                hash = "sha256-4mpMmF5jb5R2qmTjtw3mXnIYMkPmPQAtWSzGgSH+5R0=";
              })
            ];
        }))
      ];
    };

    packages.${system} = let
      files = map builtins.baseNameOf (lib.fileset.toList ./pkgs);
      sanitizeName = builtins.replaceStrings [".nix" "_"] ["" "-"];
    in
      builtins.listToAttrs (
        map (name: {
          name = sanitizeName name;
          value = pkgs.callPackage ./pkgs/${name} {};
        })
        files
      );
  };
}
