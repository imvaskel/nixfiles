{ lib, ... }:
let
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.strings) hasSuffix;
  inherit (builtins) filter;

  isNixFile = hasSuffix ".nix";

  imports = filter (p: p != ./default.nix && (isNixFile p)) (listFilesRecursive ./.);
in
{
  imports = imports;
}
