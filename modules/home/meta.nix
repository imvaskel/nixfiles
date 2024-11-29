{lib, ...}: let
  inherit (lib) mkEnableOption;
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
  };
}
