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
        name = "Gruvbox-Plus-Dark";
        package = self.gruvbox-plus-icons;
      };
      cursorTheme = {
        name = "Capitaine Cursors (Gruvbox)";
        package = pkgs.capitaine-cursors-themed;
      };
    };
  };
}
