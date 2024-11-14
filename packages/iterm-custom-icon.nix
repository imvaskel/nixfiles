{
  stdenvNoCC,
  fetchzip,
  iterm2,
}:
stdenvNoCC.mkDerivation {
  pname = "iterm2-custom-icon";
  version = iterm2.version;

  # WHY CAN I NOT USE FETCHURL
  src = fetchzip {
    url = "https://static.vaskel.gay/iterm_w.zip";
    hash = "sha256-eXAbuy+nKblvR59/IwrLU9+XxT7luOJxe+Rhoj4IP84=";
  };

  dontFixup = true;

  installPhase = ''
    FILE="$out/Applications/iTerm2.app/Contents/Resources/"
    ls
    mkdir -p $FILE
    cp iterm_w.icns "$FILE/AppIcon.icns"
    cp -nr ${iterm2}/* "$out/"
  '';
}
