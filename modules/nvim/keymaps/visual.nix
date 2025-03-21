{
  vim = {
    maps.visual = {
      "<Leader>bf" = {
        silent = true;
        action = "<cmd>lua vim.lsp.buf.format {}<cr>";
        desc = "Format buffer";
      };

      "<Leader>y" = {
        action = ''"*y'';
        desc = "Yoink selection into system keyboard";
      };

      "x" = {
        action = ''"_x'';
        desc = "Delete single character";
      };

      "<Leader>w" = {
        action = "<C-w>";
        desc = "Enter window mode";
      };

      "<Leader>h" = {
        action = "<cmd>HopWord<CR>";
      };

      # kinda cursed look
      "J" = {
        action = ":m '>+1<CR>gv=gv";
        desc = "Moves selection down one line.";
      };

      "K" = {
        action = ":m '<-2<CR>gv=gv";
        desc = "Moves selection down one line";
      };

      "<" = {
        action = "<gv";
      };

      ">" = {
        action = ">gv";
      };

    };
  };
}
