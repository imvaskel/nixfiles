{
  pkgs,
  osConfig,
  ...
}: {
  xdg.configFile."nushell/gruvbox.nu".source = ./gruvbox.nu;

  programs.nushell = {
    enable = true;
    envFile.source = ./env.nu;
    configFile.source = ./config.nu;
    extraConfig = ''
      use gruvbox.nu

      ${pkgs.krabby}/bin/krabby random -i

    '';
  };
}
