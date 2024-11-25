{
  pkgs,
  config,
  ...
}: let
  inherit (pkgs.stdenv) isLinux isDarwin;
  configDir =
    if isDarwin
    then config.home.homeDirectory + "/Library/Application Support"
    else config.xdg.dataHome;
in {
  xdg.enable = isLinux;

  # Sets GOPATH to ~/.local/share/go or ~/Library/Application Support/
  home.sessionVariables.GOPATH = configDir + "/go" ;
}
