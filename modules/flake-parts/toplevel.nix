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
    # probably rigged but w/e
    packages."aarch64-darwin"."iterm-custom-icon" = let
      pkgs = (import inputs.nixpkgs) {system = "aarch64-darwin";};
    in
      pkgs.callPackage "${self}/packages/iterm-custom-icon.nix" {};
  };
}
