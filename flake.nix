{
  description = "My home-manager configuration";

  nixConfig = {
    extra-substituters = ["https://hyprland.cachix.org"];
    extra-trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    # Broken right now.
    #hyprspace = {
    #  url = "github:KZDKM/Hyprspace";
    #  inputs.hyprland.follows = "hyprland";
    #};
    # Also broken lol
    # hycov = {
    #  url = "github:DreamMaoMao/hycov";
    #  inputs.hyprland.follows = "hyprland";
    #};
    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nixgl,
    hyprland,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [nixgl.overlay];
    };
    lib = pkgs.lib;
    commonImports = [
      (lib.fileset.toList ./home/modules)
      (lib.fileset.toList ./home/common)
      hyprland.homeManagerModules.default
    ];
  in {
    homeConfigurations."skylar" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = lib.flatten [
        ./home/skylar.nix
        commonImports
      ];

      extraSpecialArgs = {
        user = {
          home = "/home/skylar";
          name = "skylar";
          inherit system;
        };
        inherit inputs;
      };
    };

    formatter.${system} = pkgs.alejandra;
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra # formatter
        nil # LSP
      ];
    };

    packages.${system} = {
      "gruvbox-material-gtk" = pkgs.callPackage ./pkgs/gruvbox_material_gtk.nix {};
      "capitaine-cursors" = pkgs.callPackage ./pkgs/capitaine_cursors.nix {};
    };
  };
}
