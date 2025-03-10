{config, ...}: {
  nix.registry = {
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
}
