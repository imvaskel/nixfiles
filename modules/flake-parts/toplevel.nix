# Top-level flake glue to get our configuration working
{ inputs, ... }:
{
  imports = [
    inputs.nixos-unified.flakeModules.default
    inputs.nixos-unified.flakeModules.autoWire
  ];
  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    let
      inherit (inputs) nvf;
      nvfCfg = nvf.lib.neovimConfiguration {
        extraSpecialArgs = {
          inherit self';
          nvfLib = nvf.lib;
        };
        inherit pkgs;
        modules = [ ../nvim ];
      };
    in
    {
      formatter = pkgs.nixfmt-rfc-style;

      packages =
        {
          nvim = nvfCfg.neovim;
        }
        // (lib.packagesFromDirectoryRecursive {
          inherit (pkgs) callPackage;
          directory = ../../packages;
        });
    };

  flake = {
  };
}
