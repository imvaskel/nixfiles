{ pkgs, ... }:
{
  # Set up transient prompt
  programs.fish.functions.starship_transient_prompt_func = ''
    ${pkgs.starship}/bin/starship module character
  '';

  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      # Kinda cursed, but it's w/e
      format =
        (builtins.replaceStrings [ "\n" ] [ "" ] ''
          [](fg:blue)
          $username$hostname
          [](fg:blue bg:pink)
          $directory
          [](fg:pink bg:white)
          $git_branch$git_commit$git_state$git_status
          [ ](bg:white)
          [](fg:white bg:pink)
          $c
          $cmake
          $dart
          $deno
          $dotnet
          $elixir
          $erlang
          $golang
          $haskell
          $java
          $kotlin
          $lua
          $nodejs
          $python
          $ruby
          $rust
          $swift
          $package
          [ ](bg:pink)
          [](fg:pink bg:pink)
          $cmd_duration
          [ ](bg:pink)
          $nix_shell
          [](bg:#pink)
          [](fg:pink bg:blue)
          $time
          [](fg:blue)
        '')
        + "\n$character";

      palette = "trans-gruvbox";

      palettes = {
        trans = {
          blue = "#5BCEFA";
          pink = "#F5A9B8";
          foreground = "#000000";
          white = "#FFFFFF";
        };
        pastel-enby = {
          yellow = "#E1C269";
          white = "#DAD1D2";
          purple = "#A25BB1";
          foreground = "#000000";
        };
        trans-gruvbox = {
          blue = "#7DAEA3";
          foreground = "#000000";
          pink = "#d3869b";
          white = "#ddc7a1";
          red = "#ea6962";
        };
      };

      username = {
        style_user = "bg:blue fg:foreground";
        style_root = "bg:blue fg:foreground";
        show_always = true;
        format = "[$user ]($style)";
      };

      hostname = {
        style = "bg:blue fg:foreground";
        format = "[\uf178  ssh: $hostname ]($style)";
      };

      directory = {
        truncation_symbol = "…/";
        truncation_length = 5;
        style = "bg:pink fg:foreground";
        format = "[ $path ]($style)";
      };
      git_branch = {
        symbol = "";
        style = "bg:white fg:foreground";
        format = "[ $symbol $branch(:$remote_branch)]($style)";
      };

      git_commit = {
        tag_symbol = " ";
        style = "bg:white fg:foreground";
        format = "[ \\($hash$tag\\)]($style)";
      };

      git_state = {
        style = "bg:white fg:foreground";
        format = "[$state ($progress_current/$progress_total)]($style)";
      };

      git_status = {
        style = "bg:white fg:foreground";
        format = "[($all_status$ahead_behind)]($style)";
      };

      c = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version(-$name))]($style)";
      };

      cmake = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      dart = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      deno = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      dotnet = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)( 🎯$tfm)]($style)";
      };

      elixir = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version \\(OTP $otp_version\\))]($style)";
      };

      erlang = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      golang = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      haskell = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      java = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      kotlin = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      lua = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      nodejs = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      python = {
        style = "bg:pink fg:foreground";
        format = "[ \${symbol}\${pyenv_prefix}(\${version} )(\\($virtualenv\\))]($style)";
      };

      ruby = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      rust = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      swift = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      package = {
        style = "bg:pink fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      cmd_duration = {
        style = "bg:pink fg:foreground";
        format = "[ $duration]($style)";
      };

      time = {
        disabled = false;
        time_format = "%I:%M %P";
        style = "bg:blue fg:foreground";
        format = "[ ♥ $time ]($style)";
      };

      nix_shell = {
        style = "bg:pink fg:foreground";
        format = "[via $symbol]($style)";
      };

      character = {
        success_symbol = " [❯](fg:white) ";
        error_symbol = " [✘](bold red) ";
      };
    };
  };
}
