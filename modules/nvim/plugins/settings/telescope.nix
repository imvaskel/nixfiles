{
  vim = {
    telescope = {
      enable = true;
      setupOpts = {
        extensions = {
          file_browser = {
            hijack_netrw = true;
          };
        };
      };
      mappings = {
        resume = null;
      };
    };
  };
}
