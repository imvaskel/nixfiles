{ pkgs, ... }:

{
  home.sessionVariables = {
    GTK_THEME = "Gruvbox-Dark-BL-LB";
  };

  gtk = {
    enable = true;
    theme = {
      name = "GruvBox";
      package = pkgs.gruvbox-gtk-theme;
    };
  };
}
