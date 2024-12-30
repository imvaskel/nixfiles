{
  programs.nvf.settings.lua = {
    maps.visual = {
      "<Leader>bf" = {
        silent = true;
        action = "<cmd>lua vim.lsp.buf.format {}<cr>";
        desc = "Format buffer";
      };

      "<Leader>y" = {
        action = ''"+y'';
        desc = "Yoink selection into system keyboard";
      };

      "<Leader>w" = {
        action = "<C-w>";
        desc = "Enter window mode";
      };
      "<Leader>h" = {
        action = "<cmd>HopWord<CR>";
      };
    };
  };
}
