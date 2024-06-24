{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  mainMod = "SUPER";
  colors = {
    bg = "rgb(282828)";
    fg = "rgb(d4be98)";
    yellow = "rgb(d8a657)";
    red = "rgb(ea6962)";
    green = "rgb(a9b665)";
  };
  inherit (pkgs) hyprland hypridle;
  cfg = config.dotfiles.type;
  inherit (lib) mkIf;

  discordScript = pkgs.writeShellScriptBin "discord-switcher" ''
    hyprctl dispatch togglespecialworkspace discord

    # If discord isn't opened, open it.
    if ! hyprctl clients -j | jq -e '.[] | select(.class=="vesktop")'; then
        hyprctl dispatch exec vesktop
    fi
  '';
in {
  config = mkIf cfg.graphical {
    home.packages = [
      pkgs.nixgl.nixGLMesa
      pkgs.nixgl.nixVulkanMesa
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.variables = ["--all"];
      settings = {
        "$terminal" = "kitty";
        "$fieManager" = "thunar";
        "$menu" = "~/.config/rofi/launchers/type-1/launcher.sh";
        "$ags" = "ags -b hypr -c ~/ags/config.js";

        exec-once = [
          "1password --silent" # installed globally in arch
          "${hyprland}/bin/hyprpm reload -n"
          "wl-paste --watch cliphist store"
          "swww-daemon"
          "~/.config/hypr/scripts/wallpaper.fish"
          "~/.cargo/bin/soteria"
          "swaync"
          "${hypridle}/bin/hypridle"
          "$ags"
        ];

        env = [
          "XCURSOR_SIZE,24"
          "QT_QPA_PLATFORMTHEME,qt5ct"
          "MOZ_ENABLE_WAYLAND,1"
        ];

        input = {
          kb_layout = "us";
          follow_mouse = 1;
        };

        general = {
          gaps_in = 4;
          gaps_out = 8;
          border_size = 2;
          "col.active_border" = colors.fg;
          "col.inactive_border" = colors.bg;
          layout = "dwindle";
          resize_on_border = true;
        };

        decoration = {
          rounding = 8;
          blur = {
            enabled = true;
            size = 8;
            passes = 2;
          };
        };

        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        windowrulev2 = [
          "suppressevent maximize, class:.* # You'll probably like this."
          "float, class:.*"
          "workspace special:discord,class:vesktop"
          "pin,class:gay.vaskel.Soteria"
          "stayfocused, title:^()$,class:^(steam)$"
          "minsize 1 1, title:^()$,class:^(steam)$"
        ];

        layerrule = [
          "animation slide, swaync-notification-window"
        ];

        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = [
          "${mainMod}, T, exec, $terminal"
          "${mainMod}, Q, killactive,"
          "${mainMod}, M, exit,"
          "${mainMod}, E, exec, thunar"
          "${mainMod}, A, exec, ~/.config/hypr/scripts/floating.fish"
          "${mainMod}, P, pseudo, # dwindle"
          "${mainMod}, J, togglesplit, # dwindle"
          "${mainMod}, F, fullscreen, 1"
          "${mainMod}, V, exec, ~/.config/hypr/scripts/clipboard.fish history"
          # Broken "${mainMod}, grave, overview:toggle,"

          # Move focus with mainMod + arrow keys
          "${mainMod}, left, movefocus, l"
          "${mainMod}, right, movefocus, r"
          "${mainMod}, up, movefocus, u"
          "${mainMod}, down, movefocus, d"

          # Switch workspaces with mainMod + [0-9]
          "${mainMod}, 1, workspace, 1"
          "${mainMod}, 2, workspace, 2"
          "${mainMod}, 3, workspace, 3"
          "${mainMod}, 4, workspace, 4"
          "${mainMod}, 5, workspace, 5"
          "${mainMod}, 6, workspace, 6"
          "${mainMod}, 7, workspace, 7"
          "${mainMod}, 8, workspace, 8"
          "${mainMod}, 9, workspace, 9"
          "${mainMod}, 0, workspace, 10"

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "${mainMod} SHIFT, 1, movetoworkspace, 1"
          "${mainMod} SHIFT, 2, movetoworkspace, 2"
          "${mainMod} SHIFT, 3, movetoworkspace, 3"
          "${mainMod} SHIFT, 4, movetoworkspace, 4"
          "${mainMod} SHIFT, 5, movetoworkspace, 5"
          "${mainMod} SHIFT, 6, movetoworkspace, 6"
          "${mainMod} SHIFT, 7, movetoworkspace, 7"
          "${mainMod} SHIFT, 8, movetoworkspace, 8"
          "${mainMod} SHIFT, 9, movetoworkspace, 9"
          "${mainMod} SHIFT, 0, movetoworkspace, 10"

          # Discord special workspace (this is better than how i was doing it before)
          "${mainMod}, D, exec, ${discordScript}/bin/discord-switcher"

          # Scroll through existing workspaces with mainMod + scroll
          "${mainMod}, mouse_down, workspace, e+1"
          "${mainMod}, mouse_up, workspace, e-1"

          # Move/resize windows with mainMod + LMB/RMB and dragging
          "CTRL SHIFT, R, exec, $ags quit; $ags"
          # BROKEN "${mainMod}, TAB, overview:toggle,"
          #"ALT, TAB, hycov:toggleoverview,"

          "ALT, SPACE, exec, $menu"
          "ALT, TAB, cyclenext,"
          "CTRL and SHIFT, 1, exec, $ags -r 'media.screenshot(true)'"
          "CTRL and SHIFT, 2, exec, $ags -r 'media.screenshot()'"
          "CTRL and SHIFT, 3, exec, $ags -r 'media.start()'"

          ",XF86AudioPrev, exec, playerctl previous"
          ",XF86AudioNext, exec, playerctl next"
          ",XF86AudioPlay, exec, playerctl play-pause"
          ",XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
          ",XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
          ",XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"

          # 1password forwarding
          "CTRL and SHIFT, space, pass, class:1Password"
          "CTRL, \\, pass, class:1password"
        ];

        bindm = [
          # Move/resize windows with mainMod + LMB/RMB and dragging
          "${mainMod}, mouse:272, movewindow"
          "${mainMod}, mouse:273, resizewindow"
        ];

        plugin = {
          hyprbars = {
            "$bar_button_size" = 20;
            bar_color = colors.bg;
            bar_height = 25;
            bar_part_of_window = true;
            col.text = colors.fg;
            bar_precedence_over_border = true;
            hyprbars-button = [
              "${colors.red}, $bar_button_size, 󰖭, hyprctl dispatch killactive"
              "${colors.yellow}, $bar_button_size, , hyprctl dispatch fullscreen 1"
            ];
            bar_button_padding = 10;
          };

          overview = {
            exitOnSwitch = true;
          };

          hycov = {
            enable_alt_release_exit = 1;
            alt_toggle_auto_next = 0;
            enable_hotarea = false;
          };
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          new_is_master = true;
        };

        gestures = {
          workspace_swipe = false;
        };
      };
    };
  };
}
