{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./xdg.nix
    ./starship
    ./nvim
    ./shell.nix
    ./gtk.nix
  ];

  home.packages = with pkgs; [
    direnv
    git
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
