{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkIf;
in
  mkIf pkgs.stdenv.isDarwin {
    home.packages = [
      pkgs.iterm2
    ];
  }
