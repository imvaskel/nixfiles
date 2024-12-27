{
  pkgs,
  flake,
  ...
}: let
  inherit (flake.inputs) nh;
in {
  home = {
    packages = with pkgs; [
      nh.packages.${pkgs.system}.default
      devenv
      uv
    ];
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
  };

  programs = {
    bash.enable = true;
    direnv = {
      enable = true;
      config.hide_env_diff = true;
      nix-direnv.enable = true;
    };
    fzf.enable = true;
    zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
  };
}
