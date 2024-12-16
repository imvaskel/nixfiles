# Top-level flake glue to get our configuration working
{inputs, ...}: {
  imports = [
    inputs.nixos-unified.flakeModules.default
    inputs.nixos-unified.flakeModules.autoWire
  ];
  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    formatter = pkgs.alejandra;

    packages = lib.packagesFromDirectoryRecursive {
      inherit (pkgs) callPackage;
      directory = ../../packages;
    };
  };

  flake = {
  };
}
