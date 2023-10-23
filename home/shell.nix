{
  pkgs,
  home-manager,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable the greeting
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
