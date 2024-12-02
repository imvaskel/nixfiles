{
  flake,
  ...
}: let
  inherit (flake.inputs) self;
in {
  imports = [
    ./skylar.nix
    self.homeModules.darwin
  ];
}