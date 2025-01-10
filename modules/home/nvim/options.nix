{
  programs.nvf = {
    enable = true;
    defaultEditor = true;
    settings.vim = {
      vimAlias = true;
      viAlias = true;

      preventJunkFiles = true;
      useSystemClipboard = true;

      enableLuaLoader = true;
      enableEditorconfig = true;

      options = {
        # Tabs @ 8 spaces is wild
        tabstop = 4;
        shiftwidth = 4;
      };
    };
  };
}
