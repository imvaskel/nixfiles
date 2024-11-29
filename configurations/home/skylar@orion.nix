{
  pkgs,
  flake,
  lib,
  ...
}: let
in {
  imports = [
    ./skylar.nix
  ];

  # Nix on arch kind of sucks due to not playing well with graphical applications.
  home.packages = lib.mkForce [pkgs.home-manager pkgs.nh pkgs.man];
}
