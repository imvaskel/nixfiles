{pkgs, ...}: {
  imports = [
    ./wezterm
    #./gtk.nix
    ./gnome
  ];

  home.packages = with pkgs; [
    signal-desktop
  ];
}
