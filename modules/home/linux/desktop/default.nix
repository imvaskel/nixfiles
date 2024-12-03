{pkgs, ...}: {
  imports = [
    #./gtk.nix
    ./gnome
  ];

  home.packages = with pkgs; [
    signal-desktop
  ];
}
