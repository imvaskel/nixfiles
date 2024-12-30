{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs) self;
in {
  programs.nvf.settings.vim = {
    startPlugins = with pkgs.vimPlugins; [
      "nvim-treesitter"
      typst-vim
    ];
    extraPlugins = {
      "better-diagnostics-virtual-text" = {
        package = self.packages.${pkgs.system}.better-diagnostic-virtual-text;
        setup = ''
          require("better-diagnostic-virtual-text").setup({})
        '';
      };
    };
  };
}
