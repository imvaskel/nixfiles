{pkgs, ...}: {
  fonts.packages = with pkgs; [
    maple-mono-NF
    atkinson-hyperlegible
    atkinson-monolegible
  ];
}
