{ darwin, home-manager, nixpkgs, ... }:

darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  modules = [
    ({ ... }: {
      users.users.austin = { name = "austin"; };

      services.nix-daemon.enable = true;

      security.pam.enableSudoTouchIdAuth = true;

      programs.fish.enable = true;
      programs.zsh.enable = false;
    })
  ];
  # system.stateVersion = 4;

}
