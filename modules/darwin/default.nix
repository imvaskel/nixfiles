{
  pkgs,
  flake,
  lib,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = lib.attrValues (lib.filterAttrs (k: v: k != "default") self.darwinModules);

  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;
  nix.gc.automatic = true;

  programs.zsh.enable = true;
  programs.fish.enable = true;

  environment.shells = [
    pkgs.zsh
    pkgs.fish
  ];
}
