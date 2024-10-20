{
  ezModules,
  lib,
  ...
}: {
  imports = lib.attrValues {
    inherit (ezModules) fish git meta starship nu;
  };

  programs.direnv.enable = true;
}
