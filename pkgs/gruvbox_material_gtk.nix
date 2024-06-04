{
  stdenvNoCC,
  fetchFromGitHub,
  gtk-engine-murrine,
  lib,
  ...
}:
stdenvNoCC.mkDerivation rec {
  pname = "gruvbox-material-gtk";
  version = "2023-08-28"; # it seems that nix versions like this if there is no versioning

  src = fetchFromGitHub {
    owner = "TheGreatMcPain";
    repo = "gruvbox-material-gtk";
    rev = "a1295d8bcd4dfbd0cd6793d7b1583b442438ed89";
    sha256 = "sha256-VumO8F4ZrFI6GZU1XXaw4MCnP+Nla1rVS3uuSUzpl9E=";
  };

  propagatedUserEnvPkgs = [
    gtk-engine-murrine
  ];

  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    mkdir -p $out/share/themes
    mkdir -p $out/share/icons

    cp -a themes/* $out/share/themes
    cp -a icons/* $out/share/icons
  '';
}
