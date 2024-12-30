{
  programs.nvf.settings.lua = {
    binds.whichKey.enable = true;
    luaConfigRC."which-key-add" = ''
      require("which-key").add({
        { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
      })
    '';
  };
}
