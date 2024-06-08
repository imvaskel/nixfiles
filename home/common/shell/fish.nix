{
  pkgs,
  lib,
  flakePath,
  ...
}: let
  homeManger = pkgs.home-manager;
in {
  home.packages = with pkgs; [nh];

  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = "";
    };
    shellAbbrs = {
      ls = "eza";
      la = "eza -a";
      ll = "eza --git -lg --icons";
      lla = "eza --git --lga --icons";
    };
  };
}
