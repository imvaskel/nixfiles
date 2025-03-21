{
  lib,
  config,
  ...
}:
let
  cfg = config.dotfiles.type;
  inherit (lib) mkIf;
in
{
  config.programs.hyprlock = mkIf cfg.graphical {
    enable = true;
    settings = {
      # https://github.com/vernette/Hyprsnap/blob/main/.config/hypr/hyprlock.conf
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        ignore_empty_input = true;
      };

      background = {
        monitor = "";
        path = "~/Pictures/Wallpapers/current";
        blur_passes = 3;
        blur_size = 5;
      };

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<b><big> $(date +"%H:%M") </big></b>"'';
          color = "rgba(255, 255, 255, 0.8)";
          font_size = 64;
          font_family = "JetBrains Mono Nerd Font 10";
          position = "0, 50";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = "Type to unlock";
          color = "rgba(255, 255, 255, 0.4)";
          font_size = 20;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 30";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = {
        monitor = "";
        size = "200, 50";
        outline_thickness = 0;
        dots_size = 0.25;
        dots_spacing = 0.3;
        dots_center = true;
        dots_rounding = -1;
        inner_color = "rgba(0, 0, 0, 0.2)";
        font_color = "rgba(255, 255, 255, 0.6)";
        fail_color = "rgba(255, 60, 60, 0.2)";
        fade_on_empty = true;
        fade_timeout = 200;
        placeholder_text = "";
        fail_text = "Wrong password <b>($ATTEMPTS)</b>";
        fail_transition = 300;
        hide_input = false;
        rounding = -1;
        position = "0, -200";
        halign = "center";
        valign = "center";
      };
    };
  };
}
