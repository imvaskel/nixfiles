{...}: {
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        git
        nil
        statix
        alejandra
      ];
    };
  };
}
