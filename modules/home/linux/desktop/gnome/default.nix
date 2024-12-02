{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./dconf.nix
  ];
  # Don't install gnome-shell via nix because that doesn't usually work out well.
  programs.gnome-shell = {
    enable = true;
    extensions = let
      inherit (pkgs) gnomeExtensions;
    in [
      {
        id = "dash-to-dock@micxgx.gmail.com";
        package = gnomeExtensions."dash-to-dock";
      }

      {
        id = "appindicatorsupport@rgcjonas.gmail.com";
        package = gnomeExtensions."appindicator";
      }

      {
        id = "just-perfection-desktop@just-perfection";
        package = gnomeExtensions."just-perfection";
      }

      {
        id = "search-light@icedman.github.com";
        package = gnomeExtensions."search-light";
      }

      {
        id = "clipboard-indicator@tudmotu.com";
        package = gnomeExtensions."clipboard-indicator";
      }

      {
        id = "caffeine@patapon.info";
        package = gnomeExtensions."caffeine";
      }

      {
        id = "user-theme@gnome-shell-extensions.gcampax.github.com";
        package = gnomeExtensions."user-themes";
      }
    ];
  };
}
