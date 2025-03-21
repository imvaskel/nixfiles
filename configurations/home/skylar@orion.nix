{
  pkgs,
  lib,
  flake,
  config,
  ...
}:
let
  inherit (flake.inputs) self nixgl;
in
{
  imports = [
    ./skylar.nix
    self.homeModules.linux
  ];

  targets.genericLinux.enable = true;
  dotfiles.wrap = true;

  nixGL = {
    packages = nixgl.packages;
    defaultWrapper = "mesa";
    installScripts = [ "mesa" ];
  };
}
