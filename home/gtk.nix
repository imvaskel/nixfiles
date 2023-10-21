{
  pkgs,
  flags,
  ...
}: {
  home.sessionVariables = {
    GTK_THEME = "Gruvbox-Dark-BL-LB";
  };

  gtk = {
    enable = !flags.headless;
    theme = {
      name = "GruvBox";
      package = pkgs.gruvbox-gtk-theme;
    };
  };
}
