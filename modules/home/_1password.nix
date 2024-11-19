{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib.lists) optionals;
  cfg = config.dotfiles.type;
in {
  # Only the cli because the GUI needs to be installed in macos's /Applications
  # This means nix cannot manage it.
  home.packages = optionals cfg.graphical [
    pkgs._1password-cli
  ];
}
