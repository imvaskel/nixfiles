{
  pkgs,
  flake,
  lib,
  ...
}: let
  inherit (flake.inputs) self mac-app-util;
in {
  imports = lib.attrValues (lib.filterAttrs (k: _: k != "default") self.darwinModules);

  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;
  nix.gc.automatic = true;
  #nix.package = pkgs.lix;

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
