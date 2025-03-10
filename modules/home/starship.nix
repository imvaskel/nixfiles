{pkgs, ...}: {
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
        (builtins.replaceStrings ["\n"] [""] ''
          [](bg: yellow)
          $username$hostname
          [](fg:yellow bg:white)
          $directory
          [](fg:white bg:white)
          $git_branch$git_commit$git_state$git_status
          [ ](bg:white)
          [](fg:white bg:purple)
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
          [ ](bg:purple)
          [](fg:purple bg:purple)
          $cmd_duration
          [ ](bg:purple)
          $nix_shell
          [](bg:#purple)
          [](fg:purple bg:purple)
          $time
          [](fg:purple)
        '')
        + "\n$character";

      palette = "pastel-enby";

      palettes.pastel-enby = {
        yellow = "#E1C269";
        white = "#DAD1D2";
        purple = "#A25BB1";
        foreground = "#000000";
      };

      username = {
        style_user = "bg:yellow fg:foreground";
        style_root = "bg:yellow fg:foreground";
        show_always = true;
        format = "[$user ]($style)";
      };

      hostname = {
        style = "bg:yellow fg:foreground";
        format = "[\uf178  ssh: $hostname ]($style)";
      };

      directory = {
        truncation_symbol = "…/";
        truncation_length = 5;
        style = "bg:white fg:foreground";
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
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version(-$name))]($style)";
      };

      cmake = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      dart = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      deno = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      dotnet = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)( 🎯$tfm)]($style)";
      };

      elixir = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version \\(OTP $otp_version\\))]($style)";
      };

      erlang = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      golang = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      haskell = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      java = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      kotlin = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      lua = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      nodejs = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      python = {
        style = "bg:purple fg:foreground";
        format = "[ \${symbol}\${pyenv_prefix}(\${version} )(\\($virtualenv\\))]($style)";
      };

      ruby = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      rust = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      swift = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      package = {
        style = "bg:purple fg:foreground";
        format = "[ $symbol($version)]($style)";
      };

      cmd_duration = {
        style = "bg:purple fg:foreground";
        format = "[ $duration]($style)";
      };

      time = {
        disabled = false;
        time_format = "%I:%M %P";
        style = "bg:purple fg:foreground";
        format = "[ ♥ $time ]($style)";
      };

      nix_shell = {
        style = "bg:purple fg:foreground";
        format = "[via $symbol]($style)";
      };

      character = {
        success_symbol = " [❯](fg:purple) ";
        error_symbol = " [✘](bold red) ";
      };
    };
  };
}
