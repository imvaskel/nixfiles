{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  gruvbox-gtk-theme = pkgs.gruvbox-gtk-theme.override {
    colorVariants = ["dark"];
    themeVariants = ["pink"];
    tweakVariants = ["medium" "macos"];
    iconVariants = ["Dark"];
  };
  cfg = config.dotfiles.type;
in {
  config = mkIf cfg.graphical {
    gtk = {
      enable = true;
      theme = {
        name = "Gruvbox-Pink-Dark-Medium";
        package = gruvbox-gtk-theme;
      };
      iconTheme = {
        name = "Gruvbox-Dark";
        package = gruvbox-gtk-theme;
      };
      cursorTheme = {
        name = "Capitaine Cursors (Gruvbox)";
        package = pkgs.capitaine-cursors-themed;
      };
    };
  };
}
