{
  pkgs,
  lib,
  ...
}: let
in {
  imports = [
    ./skylar.nix
  ];

  # Nix on arch kind of sucks due to not playing well with graphical applications.
  home.packages = lib.mkForce [pkgs.home-manager pkgs.nh pkgs.man];

  programs.fish.functions.starship_transient_prompt_func = lib.mkForce ''
    starship module character
  '';
}
