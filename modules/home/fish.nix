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
  nh-command = if pkgs.stdenv.isDarwin then "darwin" else "os";
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
        if test $SHLVL -eq 1
            ${lib.getExe pkgs.krabby} random -i
        end
      ''}
    '';
    functions = {
      fish_greeting = "";
      edit = {
        body = ''
          $EDITOR $argv
        '';
        wraps = config.home.sessionVariables.EDITOR;
      };
      take = ''
        mkdir $argv && cd $argv
      '';
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
