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
    extraPlugins = {
      "better-diagnostics-virtual-text" = {
        package = self'.packages.better-diagnostic-virtual-text;
        setup = ''
          require("better-diagnostic-virtual-text").setup({})
        '';
      };
    };
  };
}
