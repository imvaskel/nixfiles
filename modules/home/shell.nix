{pkgs, ...}: {
  home.packages = with pkgs; [
    comma
    devenv
  ];
  programs.bash.enable = true;
  programs.fzf.enable = true;
  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"];
  };
}
