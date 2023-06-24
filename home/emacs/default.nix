{ pkgs, home-manager, ... }:

{
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom;
  };
}
