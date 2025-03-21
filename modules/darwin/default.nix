{
  pkgs,
  flake,
  lib,
  ...
}:
let
  inherit (flake.inputs) self mac-app-util nixpkgs-unstable;
in
{
  imports = lib.attrValues (lib.filterAttrs (k: _: k != "default") self.darwinModules);

  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;
  nix = {
    gc.automatic = true;
    channel.enable = false;
    registry.nixpkgs-unstable = {
      from = {
        id = "nixpkgs-unstable";
        type = "indirect";
      };
      flake = nixpkgs-unstable;
    };
  };

  programs.zsh.enable = true;
  programs.fish.enable = true;

  environment.shells = [
    pkgs.zsh
    pkgs.fish
  ];

  home-manager.sharedModules = [
    mac-app-util.homeManagerModules.default
  ];
}
