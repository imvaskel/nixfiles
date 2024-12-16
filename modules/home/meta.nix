{
  lib,
  config,
  ...
}: let
  inherit (lib) mkOption mkEnableOption mkIf mkMerge;
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
    wrap = mkEnableOption "Whether to wrap programs with nixGL.";
    wrapProg = mkOption {
      internal = true;
      default = pkg:
        mkMerge [
          (mkIf (config.dotfiles.wrap) (config.lib.nixGL.wrap pkg))
          (mkIf (!config.dotfiles.wrap) pkg)
        ];
    };
  };
}
