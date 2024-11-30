{
  pkgs,
  config,
  ...
}: {
  programs.wezterm = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.wezterm;
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
}
