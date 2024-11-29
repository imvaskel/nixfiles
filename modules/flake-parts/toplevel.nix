# Top-level flake glue to get our configuration working
{inputs, self, ...}: {
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

    # TODO: Get this goddamn library to accept the option of passing in ``--impure``.
    packages.default = self'.packages.activate.overrideAttrs (final: prev: {
      buildCommand = prev.buildCommand + ''
        sed -i 's|home-manager switch|home-manager switch --impure|' ${prev.meta.mainProgram}
      '';
    });
  };

  flake = {

  };
}
