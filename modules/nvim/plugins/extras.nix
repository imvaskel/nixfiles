{
  specialArgs,
  pkgs,
  ...
}: let
  inherit (specialArgs) self';
in {
  vim = {
    startPlugins = with pkgs.vimPlugins; [
      "nvim-treesitter"
      typst-vim
    ];
    lazy.plugins = {
    };
    extraPlugins = let
      plugins = pkgs.vimPlugins;
    in {
      "better-diagnostics-virtual-text" = {
        package = self'.packages.better-diagnostic-virtual-text;
        setup = ''
          require("better-diagnostic-virtual-text").setup({})
        '';
      };
      telescope-file-browser-nvim = {
        package = plugins.telescope-file-browser-nvim;
        setup = ''
          require("telescope").load_extension "file_browser"
        '';
      };
    };
  };
}
