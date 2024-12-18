{
  stdenvNoCC,
  fetchFromGitHub,
  gtk-engine-murrine,
  ...
}:
stdenvNoCC.mkDerivation rec {
  pname = "gruvbox-material-gtk";
  version = "2024-08-09";

  src = fetchFromGitHub {
    owner = "TheGreatMcPain";
    repo = "gruvbox-material-gtk";
    rev = "808959bcfe8b9409b49a7f92052198f0882ae8bc";
    hash = "sha256-NHjE/HI/BJyjrRfoH9gOKIU8HsUIBPV9vyvuW12D01M=";
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
