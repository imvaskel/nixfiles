{...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      "$font" = "M+1Code Nerd Font Mono";
      "$fore" = "rgb(d4be98)";

      background = {
        monitor = "";
        #path = ~/Pictures/dune.png
        # blur_passes = 3
        # contrast = 0.8916
        # brightness = 0.8172
        # vibrancy = 0.1696
        # vibrancy_darkness = 0.0
        color = "rgb(282828)";
      };

      # GENERAL
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = true;
      };

      # INPUT FIELD
      input-field = {
        monitor = "";
        size = "250, 60";
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "rgba(282828ff)";
        inner_color = "rgba(32302fff)";
        font_color = "rgb(d4be98)";
        fade_on_empty = false;
        font_family = "M+1Code Nerd Font Mono";
        placeholder_text = ''<i><span foreground="##d4be98">Input Password...</span></i>'';
        hide_input = false;
        position = "0, -120";
        halign = "center";
        valign = "center";
      };

      label = [
        # TIME
        {
          monitor = "";
          text = "cmd[update:1000] date +%I:%M";
          color = "$fore";
          font_size = 120;
          font_family = "$font SemBd";
          position = "0, -300";
          halign = "center";
          valign = "top";
        }
        # USER
        {
          monitor = "";
          text = "Welcome back, $USER.";
          color = "$fore";
          font_size = 25;
          font_family = "$font";
          position = "0, -40";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
