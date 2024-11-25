{pkgs, ...}: {
  home.packages = with pkgs; [
    comma
    devenv
  ];
  programs.fzf.enable = true;
  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"];
  };
}
