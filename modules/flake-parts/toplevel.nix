# Top-level flake glue to get our configuration working
{
  inputs,
  self,
  ...
}: {
  imports = [
    inputs.nixos-unified.flakeModules.default
    inputs.nixos-unified.flakeModules.autoWire
  ];
  perSystem = {
    self',
    pkgs,
    ...
  }: {
    formatter = pkgs.alejandra;

    packages.default = self'.packages.activate;
  };

  flake = {
  };
}
