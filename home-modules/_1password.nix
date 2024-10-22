{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib.lists) optionals;
  cfg = config.dotfiles.type;
in {
  home.packages = optionals cfg.graphical [
    pkgs._1password
    pkgs._1password-gui
  ];
}
