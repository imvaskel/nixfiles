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
  imports = lib.filterAttrs (k: v: k != "default") self.homeModules;
in {
  imports = lib.attrValues imports;

    home.packages = allPackages;

  nixpkgs.config.allowUnfree = true;

  programs.direnv.enable = true;
}
