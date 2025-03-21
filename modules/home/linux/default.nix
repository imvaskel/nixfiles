{
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  imports = [
    ./desktop
  ];
}
