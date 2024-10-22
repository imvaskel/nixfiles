{
  pkgs,
  lib,
  config,
  ...
}: let
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
        if test $SHLVL -eq 1
            ${pkgs.krabby}/bin/krabby random -i
        end
      ''}
    '';
    functions.fish_greeting = "";
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza";
      la = "${pkgs.eza}/bin/eza -a";
      ll = "${pkgs.eza}/bin/eza --git -lg --icons";
      lla = "${pkgs.eza}/bin/eza --git --lga --icons";
    };
  };
}
