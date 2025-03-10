{
  pkgs,
  lib,
  ...
}: let
  mini-packages = with pkgs.vimPlugins; [
    mini-basics
    mini-comment
    mini-cursorword
    mini-files
    mini-git
    mini-hipatterns
    mini-fuzzy
    mini-move
    mini-notify
    mini-statusline
  ];
  sanitize-name = builtins.replaceStrings ["-"] ["."];
  mini-plugins = lib.foldl' (acc: pkg:
    acc
    // {
      "${pkg.pname}" = {
        package = pkg;
        setup = "require('${sanitize-name pkg.pname}').setup({})";
      };
    }) {}
  mini-packages;
in {
  vim = {
    luaConfigRC.mini-files = ''
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local b = args.data.buf_id
          vim.keymap.set("n", "<CR>", MiniFiles.go_in, { buffer = b })
        end,
      })
    '';
    extraPlugins = mini-plugins;
  };
}
