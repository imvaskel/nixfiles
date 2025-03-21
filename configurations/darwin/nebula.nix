{
  pkgs,
  flake,
  ...
}:
let
  inherit (flake.inputs) self lix-module;
in
{
  imports = [
    self.darwinModules.default
    lix-module.nixosModules.lixFromNixpkgs
  ];

  #lix.enable = true;

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };
  nix = {
    package = pkgs.lix;
    useDaemon = true;
    settings = {
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
  };

  users.users.skylar = {
    home = "/Users/skylar";
    shell = pkgs.fish;
  };

  system.stateVersion = 5;
}
