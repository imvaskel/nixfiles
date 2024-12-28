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
    mini-cursorword
    mini-git
    mini-hipatterns
    mini-fuzzy
    mini-jump
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
  programs.nvf = {
    enable = true;
    defaultEditor = true;
    settings = {
      vim = {
        vimAlias = true;
        lsp = {
          enable = true;
        };
        languages = {
          enableLSP = true;
          enableTreesitter = true;
          enableFormat = true;
          enableExtraDiagnostics = true;
          rust.enable = true;
          nix.enable = true;
          python.enable = true;
          typst.enable = true;
          lua.enable = true;
        };
        options = {
          # Tabs @ 8 spaces is wild
          tabstop = 4;
          shiftwidth = 4;
        };
        autocomplete.nvim-cmp.enable = true;
        presence.neocord.enable = true;
        # TODO: Broken, find replacement
        #binds.cheatsheet.enable = true;
        binds.whichKey.enable = true;
        telescope.enable = true;
        autopairs.nvim-autopairs.enable = true;
        snippets.luasnip.enable = true;
        git = {
          enable = true;
          gitsigns = {
            enable = true;
            codeActions.enable = false;
            mappings = {
              nextHunk = null;
              previousHunk = null;
              stageHunk = null;
              undoStageHunk = null;
              resetHunk = null;
              stageBuffer = null;
              resetBuffer = null;
              previewHunk = null;
              blameLine = null;
              toggleBlame = null;
              diffThis = null;
              diffProject = null;
              toggleDeleted = null;
            };
          };
        };
        utility = {
          surround.enable = true;
          motion = {
            hop.enable = true;
            hop.mappings.hop = null;
            leap.enable = true;
            precognition.enable = true;
          };
        };
        theme = {
          enable = true;
          name = "base16";
          base16-colors = {
            base00 = "#292828";
            base01 = "#32302f";
            base02 = "#504945";
            base03 = "#665c54";
            base04 = "#bdae93";
            base05 = "#ddc7a1";
            base06 = "#ebdbb2";
            base07 = "#fbf1c7";
            base08 = "#ea6962";
            base09 = "#e78a4e";
            base0A = "#d8a657";
            base0B = "#a9b665";
            base0C = "#89b482";
            base0D = "#7daea3";
            base0E = "#d3869b";
            base0F = "#bd6f3e";
          };
        };
        keymaps = [
          {
            key = "jk";
            mode = "i";
            silent = true;
            action = "<ESC>";
          }
          {
            key = "<Leader>bf";
            mode = ["n" "v"];
            silent = true;
            action = "<cmd>lua vim.lsp.buf.format {}<cr>";
            desc = "Format buffer";
          }
          {
            key = "<Leader>y";
            mode = "v";
            action = ''"+y'';
            desc = "Yoink selection into system keyboard";
          }
          {
            key = "<Leader>p";
            mode = "n";
            action = ''"+p'';
            desc = "Paste from system clipboard regsiter";
          }
          {
            key = "<Leader>bf";
            mode = "n";
            action = "<cmd>nohlsearch<CR>";
            desc = "Disable highlight search";
          }
          {
            key = "x";
            mode = "n";
            action = ''"_x'';
            desc = "Delete single character";
          }
          {
            key = "<Leader>to";
            mode = "n";
            action = "<cmd>tabnew<CR>";
          }
          {
            key = "<Leader>tc";
            mode = "n";
            action = "<cmd>tabclose<CR>";
          }
          {
            key = "<Leader>tn";
            mode = "n";
            action = "<cmd>tabn<CR>";
          }
          {
            key = "<Leader>tp";
            mode = "n";
            action = "<cmd>tabp<CR>";
          }
          {
            key = "<Leader>h";
            mode = [ "v" "n"];
            action = "<cmd>HopWord<CR>";
          }
        ];
        startPlugins = with pkgs.vimPlugins; [
          "nvim-treesitter"
          typst-vim
        ];
        extraPlugins =
          mini-plugins
          // {
            "better-diagnostics-virtual-text" = {
              package = self.packages.${pkgs.system}.better-diagnostic-virtual-text;
              setup = ''
                require("better-diagnostic-virtual-text").setup({})
              '';
            };
            "nvim-treesitter-textobjects" = {
              package = pkgs.vimPlugins.nvim-treesitter-textobjects;
              after = "nvim-treesitter";
              setup = ''
                require("nvim-treesitter.configs").setup {
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                          init_selection = "\\",
                          node_incremental = "\\",
                          node_decremental = "<bs>"
                        }
                    }
                  }
              '';
            };
          };
      };
    };
  };
}
