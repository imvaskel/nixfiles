{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
in {
  options.dotfiles.type = {
    graphical = mkEnableOption "";
    headless = mkEnableOption "";
  };
}
