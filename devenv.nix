{pkgs, ...}: {
  # devenv does have languages.nix, but it seems to download a *lot*
  packages = [
    pkgs.git
    pkgs.nil
    pkgs.statix
    pkgs.alejandra
  ];
}
