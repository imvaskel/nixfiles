{
  flake,
  pkgs,
  lib,
  ...
}: let
  inherit (flake.inputs) self;
  mini-packages = with pkgs.vimPlugins; [
    mini-basics
    mini-comment
    mini-completion
    mini-cursorword
    mini-git
    mini-hipatterns
    mini-files
    mini-fuzzy
    mini-jump
    mini-move
    mini-pairs
    mini-pick
    mini-notify
    mini-statusline
    mini-surround
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
  programs.nvf = {
    enable = true;
    settings = {
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
      vim.languages = {
        enableLSP = true;
        enableFormat = true;
        enableExtraDiagnostics = true;
        rust.enable = true;
        nix.enable = true;
        python.enable = true;
      };
      vim.keymaps = [
        {
          key = "jk";
          mode = "i";
          silent = true;
          action = "<ESC>";
        }
        {
          key = "<Leader>f";
          mode = "n";
          silent = true;
          action = "<cmd>lua vim.lsp.buf.format {}<cr>";
        }
      ];
      vim.startPlugins = with pkgs.vimPlugins; [
        "neocord"
      ];
      vim.extraPlugins =
        mini-plugins
        // {
          "better-diagnostics-virtual-text" = {
            package = self.packages.${pkgs.system}.nvim-better-diagnostic-virtual-text;
            setup = ''
              require("better-diagnostic-virtual-text").setup({})
            '';
          };
          "mini-clue" = {
            package = pkgs.vimPlugins.mini-clue;
            setup = ''
              local miniclue = require('mini.clue')
              miniclue.setup({
                triggers = {
                  -- Leader triggers
                  { mode = 'n', keys = '<Leader>' },
                  { mode = 'x', keys = '<Leader>' },

                  -- Built-in completion
                  { mode = 'i', keys = '<C-x>' },

                  -- `g` key
                  { mode = 'n', keys = 'g' },
                  { mode = 'x', keys = 'g' },

                  -- Marks
                  { mode = 'n', keys = "'" },
                  { mode = 'n', keys = '`' },
                  { mode = 'x', keys = "'" },
                  { mode = 'x', keys = '`' },

                  -- Registers
                  { mode = 'n', keys = '"' },
                  { mode = 'x', keys = '"' },
                  { mode = 'i', keys = '<C-r>' },
                  { mode = 'c', keys = '<C-r>' },

                  -- Window commands
                  { mode = 'n', keys = '<C-w>' },

                  -- `z` key
                  { mode = 'n', keys = 'z' },
                  { mode = 'x', keys = 'z' },
                },

                clues = {
                  -- Enhance this by adding descriptions for <Leader> mapping groups
                  miniclue.gen_clues.builtin_completion(),
                  miniclue.gen_clues.g(),
                  miniclue.gen_clues.marks(),
                  miniclue.gen_clues.registers(),
                  miniclue.gen_clues.windows(),
                  miniclue.gen_clues.z(),
                },
              })
            '';
          };
          "mini-base16" = {
            package = pkgs.vimPlugins.mini-base16;
            setup = ''
                     require("mini.base16").setup({
              palette = {
                         base00 = "#292828",
                         base01 = "#32302f",
                         base02 = "#504945",
                         base03 = "#665c54",
                         base04 = "#bdae93",
                         base05 = "#ddc7a1",
                         base06 = "#ebdbb2",
                         base07 = "#fbf1c7",
                         base08 = "#ea6962",
                         base09 = "#e78a4e",
                         base0A = "#d8a657",
                         base0B = "#a9b665",
                         base0C = "#89b482",
                         base0D = "#7daea3",
                         base0E = "#d3869b",
                         base0F = "#bd6f3e"
                     }
              })
            '';
          };
        };
    };
  };
}
