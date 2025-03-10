{
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
    };
    languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;
      rust.enable = true;
      nix.enable = true;
      python.enable = true;
      typst.enable = true;
      lua.enable = true;
      svelte.enable = true;
    };
  };
}
