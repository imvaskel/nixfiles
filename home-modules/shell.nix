{
  pkgs,
  inputs,
  ...
}: let
  rebuild-command =
    if pkgs.stdenv.isDarwin
    then "${inputs.darwin.packages.${pkgs.system}.darwin-rebuild}/bin/darwin-rebuild"
    else "${pkgs.nixos-rebuild}/bin/nixos-rebuild";

  # probably shouldn't hard code this but w/e
  flakePath =
    if pkgs.stdenv.isDarwin
    then "~/Developer/nixfiles"
    else "~/nixfiles";

  rebuild = pkgs.writeShellScriptBin "rebuild" ''
    if [[ "$1" = "system" ]]; then
     ${rebuild-command} switch --flake ${flakePath}
    elif [[ "$1" = "home" ]]; then
     ${pkgs.home-manager}/bin/home-manager switch --flake ${flakePath}
    fi
  '';
in {
  home.packages = [
    rebuild
  ];

  programs.fzf.enable = true;
}
