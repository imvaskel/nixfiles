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
              ${lib.getExe pkgs.cbonsai} -p
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
      "paste" = {
        body = ''
          curl --data-binary @$argv https://mystb.in/api/paste | jq -r '.id' | xargs -0 printf 'https://mystb.in/%s'
        '';
      };
      "temp" = {
        body = ''
          set -x _TMP_DIR $(mktemp -d)
          pushd $_TMP_DIR > /dev/null

          echo -n "Creating a temporary shell at "
          set_color blue; echo -n "$_TMP_DIR "; set_color normal
          echo -n "with shell "
          echo "$SHELL"
          set_color red; echo "This directory will be deleted after the shell is finished."; set_color normal

          "$SHELL"
          popd > /dev/null
          rm -r $_TMP_DIR
        '';
        description = "Makes a temporary directory and spawns a subshell in it, then cleans up after.";
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
      ssh = "${lib.getExe config.programs.kitty.package} +kitten ssh";
      "run" = ",";
    };
  };
}
