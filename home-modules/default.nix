{
  ezModules,
  lib,
  ...
}: {
  imports = lib.attrValues {
    inherit (ezModules) fish git meta starship nu _1password shell;
  };

  programs.direnv.enable = true;
}
