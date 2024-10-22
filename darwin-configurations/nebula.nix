{pkgs, ...}: {
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };
  nix.useDaemon = true;
  nix.settings = {
    trusted-substituters = [
      "https://devenv.cachix.org"
    ];
    trusted-public-keys = [
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];
    trusted-users = [
      "skylar"
    ];
  };

  users.users.skylar = {
    home = "/Users/skylar";
    shell = pkgs.fish;
  };

  system.stateVersion = 5;
}
