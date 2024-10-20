{
  pkgs,
  lib,
  config,
  ...
}: let
  homeManger = pkgs.home-manager;
  cfg = config.dotfiles.type;
in {
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fish_add_path $HOME/.local/bin
      fish_add_path $HOME/.cargo/bin

      ${lib.optionalString cfg.graphical ''
        if test $SHLVL -eq 1; and command -q pokemon-colorscripts
            rustmon print --name random
        end
      ''}
    '';
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
      "random-rename" = ''
        if ! test -e $argv[1]
          echo "$(status basename): error: the argument $argv[1] does not exist"
          return 1
        end
        if path extension $argv[1]
          set extension (path extension $argv[1])
        else
          set extension ""
        end

        set file "$(head /dev/urandom | tr -dc a-z0-9 | head -c 8 )$extension"
        if test -e $file
          echo "$(status basename): error: somehow the random file $file collided with another"
          return 1
        end

        mv $argv[1] $file 2&> /dev/null
        if test $status -eq 0
          echo "moved to $file"
        else
          echo "somehow there was an error"
        end
      '';
    };
    shellAbbrs = {
      ls = "eza";
      la = "eza -a";
      ll = "eza --git -lg --icons";
      lla = "eza --git --lga --icons";
    };
  };
}
