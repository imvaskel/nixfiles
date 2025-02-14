{
  pkgs,
  lib,
  ...
}: {
  programs.kitty = {
    enable = true;
    themeFile = "GruvboxMaterialDarkMedium";
    font.name = "Maple Mono NF";
    keybindings = {
      "kitty_mod+r" = "kitten resize_window";
    };
    settings = lib.mkMerge [
      {
        enable_audio_bell = false;
        visual_bell_duration = "0.1";
        tab_bar_style = "powerline";
        macos_option_as_alt = true;

        active_tab_foreground = "#d4be98";
        active_tab_background = "#3c3836";
        active_tab_font_style = "bold-italic";
        inactive_tab_foreground = "#d4be98";
        inactive_tab_background = "#32302f";
        inactive_tab_font_style = "normal";
      }
      (lib.mkIf pkgs.stdenv.isDarwin {
        kitty_mod = "cmd";
      })
    ];
  };
}
