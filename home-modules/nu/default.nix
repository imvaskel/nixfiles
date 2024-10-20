{ ... }: {
    programs.nushell = {
        enable = true;
        envFile.source = ./env.nu;
        configFile.source = ./config.nu;
        extraConfig = (builtins.readFile ./gruvbox.nu);
    };
}