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
      devcon = {
        body = ''
          # Never let me ever touch this shit again
          set cmds (devcontainer --help | grep 'devcontainer [a-zA-Z]' | awk -F' ' '{ print $2 }')
          if contains $argv[1] $cmds
             set cmd $argv[1]
             set -e argv[1]
             devcontainer $cmd --workspace-folder . $argv
             return $status
          end
          devcontainer --help
        '';
        wraps = "devcontainer";
      };
    };
    shellAbbrs = {
      ls = "eza";
      la = "eza -a";
      ll = "eza --git -lg --icons";
      lla = "eza --git --lga --icons";
    };
  };
}
