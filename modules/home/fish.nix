{
  pkgs,
  lib,
  config,
  flake,
  ...
}: let
  cfg = config.dotfiles.type;
  inherit (flake.inputs) nh;
  nh-exe = lib.getExe nh.packages.${pkgs.system}.default;
  nh-command =
    if pkgs.stdenv.isDarwin
    then "darwin"
    else "os";
in {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      bind \t complete-and-search
    '';
    functions = {
      fish_greeting = ''
        ${lib.optionalString cfg.graphical ''
          if test $SHLVL -eq 1
              ${lib.getExe pkgs.krabby} random -i
          end
        ''}
      '';
      edit = let
        fzf = lib.getExe pkgs.fzf;
        bat = lib.getExe pkgs.bat;
      in ''
        ${fzf} --height 40% --preview '${bat} --color=always {}' --bind 'enter:become($EDITOR {})' -q "$argv"
      '';
      take = ''
        mkdir $argv && cd $argv
      '';
      # Simple nix run wrapper that runs the package by name with args
      "," = {
        body = ''
          nix run nixpkgs#$argv[1] -- $argv[2..]
        '';
        wraps = "nix run";
      };
    };
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza";
      la = "${pkgs.eza}/bin/eza -a";
      ll = "${pkgs.eza}/bin/eza --git -lg --icons";
      lla = "${pkgs.eza}/bin/eza --git --lga --icons";
      rebuild-system = "${nh-exe} ${nh-command} switch";
      rebuild-user = "${nh-exe} home switch";
    };
  };
}
