{
  vim = {
    maps.normal = {
      "<Leader>p" = {
        action = ''"*p'';
        desc = "Paste from system clipboard regsiter";
      };
      "<Leader>bf" = {
        action = "<cmd>nohlsearch<CR>";
        desc = "Disable highlight search";
      };

      "x" = {
        action = ''"_x'';
        desc = "Delete single character";
      };

      "<Leader>to" = {
        action = "<cmd>tabnew<CR>";
      };

      "<Leader>tc" = {
        action = "<cmd>tabclose<CR>";
      };

      "<Leader>tn" = {
        action = "<cmd>tabn<CR>";
      };

      "<Leader>tp" = {
        action = "<cmd>tabp<CR>";
      };

      "<Leader>h" = {
        action = "<cmd>HopWord<CR>";
      };

      "<Leader>fp" = {
        action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>";
        desc = "Telescope file browser at current buffer";
      };

      "<Leader>fr" = {
        action = "<cmd>Telescope registers";
        desc = "Telescope register browser.";
      };

      "<Tab>" = {
        action = "<cmd>tabnext<CR>";
        desc = "Next tab";
      };

      "<S-Tab>" = {
        action = "<cmd>tabprevious<CR>";
        desc = "Previous tab";
      };
    };
  };
}
