{pkgs, ...}: {
  home.packages = with pkgs; [
    comma
    devenv
    uv
  ];
  programs.bash.enable = true;
  programs.direnv = {
    enable = true;
    config.hide_env_diff = true;
    nix-direnv.enable = true;
  };
  programs.fzf.enable = true;
  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"];
  };
}
