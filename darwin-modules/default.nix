{
  pkgs,
  lib,
  ezModules,
  ...
}: {
  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  programs.zsh.enable = true;
  programs.fish.enable = true;

  environment.shells = [
    pkgs.zsh
    pkgs.fish
  ];

  imports = lib.attrValues {
    inherit (ezModules) fonts homebrew;
  };
}
