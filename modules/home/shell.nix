{
  pkgs,
  flake,
  ...
}: let
  inherit (flake.inputs) nh;
  helix-themes = pkgs.fetchFromGitHub {
    owner = "CptPotato";
    repo = "helix-themes";
    rev = "0ebf77d9e1dc3ee71fbb2a2956810cfc131d0008";
    hash = "sha256-Cr4NEEFq3XOmOvbsYpRUGkOY1Mq7wIFJzxVhf8e9T0c=";
  };
  helix-gruvbox-material = builtins.fromTOML (builtins.concatStringsSep "\n" [
    (builtins.readFile "${helix-themes}/schemes/gruvbox")
    (builtins.readFile "${helix-themes}/palettes/gruvbox/material_dark_medium")
  ]);
in {
  home = {
    packages = with pkgs; [
      nh.packages.${pkgs.system}.default
      devenv
      uv
    ];
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
  };

  programs = {
    bash.enable = true;
    direnv = {
      enable = true;
      config.hide_env_diff = true;
      nix-direnv.enable = true;
    };
    eza = {
      enable = true;
      icons = "auto";
      git = true;
      extraOptions = [
        "-g"
      ];
      enableBashIntegration = false; # I don't use bash but only for scripting
    };
    helix = {
      enable = true;
      themes."gruvbox_material_dark_medium" = helix-gruvbox-material;
      settings = {
        theme = "gruvbox_material_dark_medium";
        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
        keys.insert.j = {
          k = "normal_mode";
        };
      };
    };
    fzf = {
      enable = true;
      colors = {
        "fg" = "#d4be98";
        "fg+" = "#d4be98";
        "bg" = "#282828";
        "bg+" = "#262626";
        "hl" = "#d8a657";
        "hl+" = "#d3869b";
        "info" = "#7daea3";
        "marker" = "#e78a4e";
        "prompt" = "#a9b665";
        "spinner" = "#d8a657";
        "pointer" = "#7daea3";
        "header" = "#7c6f64";
        "border" = "#262626";
        "label" = "#d4be98";
        "query" = "#ddc7a1";
      };
    };
    zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
    bat = {
      enable = true;
      config.theme = "gruvbox-material-dark";
      themes.gruvbox-material-dark = {
        src = pkgs.fetchFromGitHub {
          owner = "molchalin";
          repo = "gruvbox-material-bat";
          rev = "843e67f926bbc4707256f6a8d0d8b819e5006bc1";
          hash = "sha256-J6UePv2qyZcvWa9IKv943i1w4bteWp2tjF9n2taYJog=";
        };
        file = "gruvbox-material-dark.tmTheme";
      };
    };
  };
}
