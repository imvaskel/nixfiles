{
  pkgs,
  lib,
  config,
  flake,
  ...
}: let
  cfg = config.dotfiles.type;
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
        fd = lib.getExe pkgs.fd;
        eza = lib.getExe pkgs.eza;
      in ''
        argparse "no-gitignore" -- $argv

        set -lx FZF_DEFAULT_COMMAND "${fd} --type f --type d --strip-cwd-prefix --hidden --exclude .git"
        set -q _flag_no_gitignore; and set -a FZF_DEFAULT_COMMAND "--no-ignore"

        ${fzf} --height 40% \
          --preview 'if test -d {}; ${eza} -a --color=always {}; else; ${bat} --style=numbers --color=always {}; end' \
          --bind 'enter:become($EDITOR {})' \
          -q "$argv"
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
      # Basically the above but nix shell
      "shell" = {
        body = ''
          nix shell nixpkgs#{$argv}
        '';
        wraps = "nix shell";
      };
    };
    shellAliases = let
      inherit (flake.inputs) nh;
      nh-exe = lib.getExe nh.packages.${pkgs.system}.default;
      nh-command =
        if pkgs.stdenv.isDarwin
        then "darwin"
        else "os";
    in {
      rebuild-system = "${nh-exe} ${nh-command} switch";
      rebuild-user = "${nh-exe} home switch";
    };
  };
}
