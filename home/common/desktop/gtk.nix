{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  self = inputs.self.packages.${pkgs.system};
  cfg = config.dotfiles.type;
in {
  config = mkIf cfg.graphical {
    gtk = {
      enable = true;
      theme = {
        name = "Gruvbox-Material-Dark";
        package = self.gruvbox-material-gtk;
      };
      iconTheme = {
        name = "Gruvbox-Material-Dark";
        package = self.gruvbox-material-gtk;
      };
      cursorTheme = {
        name = "Capitaine Cursors (Gruvbox)";
        package = self.capitaine-cursors;
      };
    };
  };
}
