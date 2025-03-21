{
  vimUtils,
  fetchFromGitHub,
}:
let
  inherit (vimUtils) buildVimPlugin;
in
buildVimPlugin {
  pname = "better-diagnostic-virtual-text";
  version = "2024-07-27";
  src = fetchFromGitHub {
    owner = "sontungexpt";
    repo = "better-diagnostic-virtual-text";
    rev = "eb3a77e714aa6c295bdb4f074fccbda637090f6e";
    hash = "sha256-x6DYr+w0FIwVgrXgip8/wSrUDqkRkAs5HxXdwjY76/I=";
  };
}
