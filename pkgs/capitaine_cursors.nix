{
  stdenvNoCC,
  gtk-engine-murrine,
  lib,
  fetchzip,
  ...
}:
stdenvNoCC.mkDerivation rec {
  pname = "capitaine-cursors";
  version = "r5";

  src = fetchzip {
    url = "https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip";
    sha256 = "ipPpmZKU/xLA45fdOvxVbtFDCUsCYIvzeps/DjhFkNg=";
    stripRoot = false;
  };

  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    mkdir -p $out/share/icons

    cp -a * $out/share/icons
  '';
}
