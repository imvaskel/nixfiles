{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./xdg.nix
    ./starship
    ./nvim
    ./fish.nix
    ./gtk.nix
  ];

  home.packages = with pkgs; [
    nixfmt
    git
    nil
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
