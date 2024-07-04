{pkgs, ...}: {
  # Set up transient prompt
  programs.fish.interactiveShellInit = ''
    eval (starship init fish)
    enable_transience

    function starship_transient_prompt_func
      starship module character
    end
  '';

  programs.starship = {
    enable = true;
    enableFishIntegration = false; # managed ourselves
    enableBashIntegration = false; # i don't use bash, but this breaks it too.
    settings = let
      yellow = "#E1C269";
      white = "#DAD1D2";
      purple = "#A25BB1";
      black = "#2E2A29";
    in {
      # Kinda cursed, but it's w/e
      format =
        (builtins.replaceStrings ["\n"] [""] ''
          [](bg: ${yellow})
          $username$hostname
          [](fg:${yellow} bg:${white})
          $directory
          [](fg:${white} bg:${white})
          $git_branch$git_commit$git_state$git_status
          [ ](bg:${white})
          [](fg:${white} bg:${purple})
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
          [ ](bg:${purple})
          [](fg:${purple} bg:${purple})
          $cmd_duration
          [](bg:#${purple})
          [](fg:${purple} bg:${purple})
          $time
          [](fg:${purple})
        '')
        + "\n$character";

      username = {
        style_user = "bg:${yellow} fg:#000000";
        style_root = "bg:${yellow} fg:#000000";
        show_always = true;
        format = "[$user ]($style)";
      };

      hostname = {
        style = "bg:${yellow} fg:#000000";
        format = "[\uf178  ssh: $hostname ]($style)";
      };

      directory = {
        truncation_symbol = "…/";
        truncation_length = 5;
        style = "bg:${white} fg:#000000";
        format = "[ $path ]($style)";
      };
      git_branch = {
        symbol = "";
        style = "bg:${white} fg:#000000";
        format = "[ $symbol $branch(:$remote_branch)]($style)";
      };

      git_commit = {
        tag_symbol = " ";
        style = "bg:${white} fg:#000000";
        format = "[ \\($hash$tag\\)]($style)";
      };

      git_state = {
        style = "bg:${white} fg:#000000";
        format = "[$state ($progress_current/$progress_total)]($style)";
      };

      git_status = {
        style = "bg:${white} fg:#000000";
        format = "[($all_status$ahead_behind)]($style)";
      };

      c = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version(-$name))]($style)";
      };

      cmake = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      dart = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      deno = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      dotnet = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)( 🎯$tfm)]($style)";
      };

      elixir = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version \\(OTP $otp_version\\))]($style)";
      };

      erlang = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      golang = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      haskell = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      java = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      kotlin = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      lua = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      nodejs = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      python = {
        style = "bg:${purple} fg:#000000";
        format = "[ \${symbol}\${pyenv_prefix}(\${version} )(\\($virtualenv\\))]($style)";
      };

      ruby = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      rust = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      swift = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      package = {
        style = "bg:${purple} fg:#000000";
        format = "[ $symbol($version)]($style)";
      };

      cmd_duration = {
        style = "bg:${purple} fg:#000000";
        format = "[ $duration]($style)";
      };

      time = {
        disabled = false;
        time_format = "%I:%M %P";
        style = "bg:${purple} fg:#000000";
        format = "[ ♥ $time ]($style)";
      };

      character = {
        success_symbol = " [](fg:${purple}) ";
        error_symbol = " [✘](bold red) ";
      };
    };
  };
}
