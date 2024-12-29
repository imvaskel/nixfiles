{
  pkgs,
  inputs,
  lib,
  ...
}: let
  inherit (inputs) wezterm-types;
in {
  # devenv does have languages.nix, but it seems to download a *lot*
  packages = [
    pkgs.git
    pkgs.nil
    pkgs.statix
    pkgs.alejandra
  ];

  enterShell = let
    inherit (builtins) map attrNames readDir concatStringsSep;
    to-link = map (x: "ln -s ${wezterm-types}/types/${x} $WEZTERM_ROOT/types/${x}") (
      attrNames (readDir "${wezterm-types}/types")
    );
  in ''
    WEZTERM_ROOT="$DEVENV_ROOT/modules/home/wezterm"
    if [[ ! -e "$WEZTERM_ROOT/types" ]]
    then
      mkdir $WEZTERM_ROOT/types
      ${
      concatStringsSep "\n" to-link
    }

      ln -s "${wezterm-types}/.luarc.json" "$WEZTERM_ROOT/.luarc.json"
      echo "${''
      ---@type Config
      _G.config
    ''}" > $WEZTERM_ROOT/types/us.lua

    fi
  '';

  scripts.nixpkgs-repl.exec = ''
    nix repl --expr 'import <nixpkgs> {}'
  '';
}
