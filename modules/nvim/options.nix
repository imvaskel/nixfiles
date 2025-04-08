{
  vim = {
    vimAlias = true;
    viAlias = true;

    additionalRuntimePaths = [
      ./runtime
    ];

    preventJunkFiles = true;

    enableLuaLoader = true;

    options = {
      # Tabs @ 8 spaces is wild
      tabstop = 4;
      shiftwidth = 4;
      exrc = true;
    };

    globals = {
      enableEditorconfig = true;
    };
  };
}
