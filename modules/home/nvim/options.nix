{
  programs.nvf = {
    enable = true;
    defaultEditor = true;
    settings.vim = {
      vimAlias = true;
      viAlias = true;

      preventJunkFiles = true;

      enableLuaLoader = true;

      options = {
        # Tabs @ 8 spaces is wild
        tabstop = 4;
        shiftwidth = 4;
      };

      globals = {
        enableEditorconfig = true;
      };
    };
  };
}
