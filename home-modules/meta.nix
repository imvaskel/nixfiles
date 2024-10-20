{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.dotfiles;
in {
  options.dotfiles = {
    type = {
      graphical = mkEnableOption "";
      headless = mkEnableOption "";
    };
    os = {
      macos = mkEnableOption "";
      linux = mkEnableOption "";
    };
    install = mkEnableOption "Whether or not to enable program installation.";
  };
  #config = mkIf (!cfg.install) {
  #  home.packages = lib.mkForce [pkgs.home-manager pkgs.nh pkgs.man];
  #};
}
