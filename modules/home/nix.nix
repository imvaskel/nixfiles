{config, ...}: {
  nix = {
    settings = {
      extra-experimental-features = [ "repl-flake" ];
    };
    registry = {
      nixfiles = {
        from = {
          id = "nixfiles";
          type = "indirect";
        };
        to = {
          type = "git";
          url = "file://${config.dotfiles.flakePath}";
        };
      };
    };
  };
}
