{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.dotfiles.type;
  wezterm-types = pkgs.fetchFromGitHub {
    owner = "gonstoll";
    repo = "wezterm-types";
    rev = "45ef8d4d98d27be3ec2e472adde4b31df1d6edcb";
    hash = "sha256-kQJ7hzMAj7lbM83kZAqcslte1EqSY/2R6oSt5s0K/V0=";
  };
in
  lib.mkIf cfg.graphical {
    programs.wezterm = {
      enable = true;
      package = config.dotfiles.wrapProg pkgs.wezterm;
      extraConfig = builtins.readFile ./config.lua;
      colorSchemes."gruvbox_material_medium_dark" = {
        ansi = [
          "#282828"
          "#ea6962"
          "#a9b665"
          "#d8a657"
          "#7daea3"
          "#d3869b"
          "#89b482"
          "#d4be98"
        ];
        background = "#282828";
        brights = [
          "#eddeb5"
          "#ea6962"
          "#a9b665"
          "#d8a657"
          "#7daea3"
          "#d3869b"
          "#89b482"
          "#d4be98"
        ];
        cursor_bg = "#D4BE98";
        cursor_border = "#D4BE98";
        cursor_fg = "#282828";
        foreground = "#D4BE98";
        selection_bg = "#D4BE98";
        selection_fg = "#45403d";
      };
    };
    home.file = {
      ".config/wezterm/types" = {
        source = "${wezterm-types}/types";
        recursive = true;
      };
      ".config/wezterm/.luarc.json".source = "${wezterm-types}/.luarc.json";
    };

    programs.fish.shellAliases.ssh = "wezterm ssh";
  }
