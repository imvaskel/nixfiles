{
  pkgs,
  flake,
  ...
}: let
  inherit (flake.inputs) nh;
in {
  home.packages = with pkgs; [
    nh.packages.${pkgs.system}.default
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
