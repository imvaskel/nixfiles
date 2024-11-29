{
  pkgs,
  lib,
  flake,
  config,
  ...
}: let
  inherit (flake.inputs) self nixgl;
in {
  imports = [
    ./skylar.nix
  ];

  nixGL = {
    packages = nixgl.packages;
    defaultWrapper = "mesa";
    installScripts = [ "mesa" ];
  };

  # just a temporary test, i use wezterm installed via arch.
  programs.alacritty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
  };
}
