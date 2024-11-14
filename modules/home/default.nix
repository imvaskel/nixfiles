{
  lib,
  flake,
  config,
  pkgs,
  ...
}: let
  inherit (flake.inputs) self mac-app-util;
  cfg = config.dotfiles.type;

  packages = [];
  graphicalPackages = with pkgs; [
    vscode
  ];

  allPackages = packages ++ (lib.optionals cfg.graphical graphicalPackages);

  # kind of cursed to be honest but i love it
  imports = lib.filterAttrs (k: v: k != "default") self.homeModules;
in {
  imports = lib.attrValues imports ++ [mac-app-util.homeManagerModules.default];

  home.packages = allPackages;

  nixpkgs.config.allowUnfree = true;
  # temporary
  nixpkgs.config.allowBroken = true;

  programs.direnv.enable = true;
}
