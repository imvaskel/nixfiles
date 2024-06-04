{
  stdenvNoCC,
  lib,
  fetchzip,
  ...
}:
stdenvNoCC.mkDerivation rec {
  pname = "gruvbox-plus-icon-pack";
  version = "5.3.1";

  src = fetchzip {
    url = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v5.3.1/gruvbox-plus-icon-pack-5.3.1.zip";
    hash = "sha256-+Sn2QKl8qdW1vvm7jRAMRzkPeHREMSl2qfJKGV1AQCY=";
  };

  dontBuild = true;
  dontFixup = true;

  # TODO: Make this decompress into a parent folder?
  installPhase = ''
    mkdir -p $out/share/icons/Gruvbox-Plus-Dark

    cp -a *  $out/share/icons/Gruvbox-Plus-Dark
  '';
}
