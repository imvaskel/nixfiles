{flake, ...}: let
  inherit (flake.inputs) self mac-app-util;
in {
  imports = [
    ./skylar.nix
    self.homeModules.darwin
    mac-app-util.homeManagerModules.default
  ];
}
