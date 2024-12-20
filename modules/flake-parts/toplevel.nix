# Top-level flake glue to get our configuration working
{inputs, ...}: {
  imports = [
    inputs.nixos-unified.flakeModules.default
    inputs.nixos-unified.flakeModules.autoWire
  ];
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    formatter = pkgs.alejandra;

    packages =
      lib.packagesFromDirectoryRecursive {
        inherit (pkgs) callPackage;
        directory = ../../packages;
      }
      // {nvim = self'.legacyPackages.homeConfigurations.skylar.config.programs.nvf.finalPackage;};
  };

  flake = {
  };
}
