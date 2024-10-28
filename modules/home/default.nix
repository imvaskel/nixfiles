{
  lib,
  flake,
  ...
}: let
  inherit (flake.inputs) self;

  # kind of cursed to be honest but i love it
  imports = lib.filterAttrs (k: v: k != "default") self.homeModules;
in {
  imports = lib.attrValues imports;

  nixpkgs.config.allowUnfree = true;

  programs.direnv.enable = true;
}
