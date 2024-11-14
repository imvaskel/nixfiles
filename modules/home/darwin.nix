{
  pkgs,
  lib,
  flake,
  ...
}: let
  inherit (flake.inputs) self;
  inherit (lib) mkIf;
in
  mkIf pkgs.stdenv.isDarwin {
    home.packages = [
      self.outputs.packages.${pkgs.system}.iterm-custom-icon
    ];
  }
