{
  programs.nvf.settings.vim = {
    binds.whichKey.enable = true;
    luaConfigRC."which-key-add" = ''
      require("which-key").add({
        { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
      })
    '';
  };
}
