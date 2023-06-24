{ pkgs, ... }:

{
   gtk = {
    enable = true;
    theme = {
      name = "GruvBox";
      package = pkgs.gruvbox-gtk-theme;
    };
   };
}
