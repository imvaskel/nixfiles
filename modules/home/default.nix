{
  lib,
  flake,
  config,
  pkgs,
  ...
}: let
  inherit (flake.inputs) self;
  cfg = config.dotfiles.type;

  packages = [];
  graphicalPackages = with pkgs; [
    vscode
  ];

  allPackages = packages ++ (lib.optionals cfg.graphical graphicalPackages);

  # kind of cursed to be honest but i love it
  imports = lib.filterAttrs (k: v: !(builtins.elem k ["default" "darwin" "linux"])) self.homeModules;
in {
  imports = lib.attrValues imports;

  home.packages = allPackages;

  nix.package = pkgs.lix;
  nixpkgs.config.allowUnfree = true;
}
