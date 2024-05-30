{
  lib,
  flags,
  user,
  ...
}: let
  inherit (lib) optionals;
  home = user.home;
in {
  imports = optionals flags.desktop [
    ./hypr
  ];

  home.sessionVariables = {
    SSH_AUTH_SOCK = "${home}/.1password/agent.sock";
  };
}
