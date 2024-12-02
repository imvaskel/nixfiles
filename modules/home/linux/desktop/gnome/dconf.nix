# Generated via dconf2nix: https://github.com/nix-commmunity/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [(mkTuple ["xkb" "us"])];
      xkb-options = ["caps:hyper" "compose:ralt" "lv3:rwin_switch"];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "pink";
      color-scheme = "prefer-dark";
      cursor-size = 24;
      cursor-theme = "Capitaine Cursors (Gruvbox) - White";
      document-font-name = "Atkinson Hyperlegible 11";
      enable-animations = true;
      font-name = "Atkinson Hyperlegible 10";
      gtk-theme = "Gruvbox-Pink-Dark-Medium";
      icon-theme = "Gruvbox-Material-Dark";
      monospace-font-name = "Maple Mono 10";
      scaling-factor = mkUint32 1;
      text-scaling-factor = mkDouble "1.0";
      toolbar-style = "text";
    };

    "org/gnome/desktop/search-providers" = {
      sort-order = ["org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop"];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/desktop/sound" = {
      event-sounds = true;
      theme-name = "ocean";
    };

    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [];
      close = ["<Alt>q"];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "icon:minimize,maximize,close";
    };

    "org/gnome/mutter" = {
      edge-tiling = true;
      overlay-key = "Super_L";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [890 550];
      initial-size-file-chooser = mkTuple [890 550];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Hyper>d";
      command = "vesktop";
      name = "Discord";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Shift><Alt>space";
      command = "/usr/bin/1password --quick-access";
      name = "1Password Quick Access";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = ["system-monitor@gnome-shell-extensions.gcampax.github.com" "window-list@gnome-shell-extensions.gcampax.github.com"];
      enabled-extensions = ["user-theme@gnome-shell-extensions.gcampax.github.com" "appindicatorsupport@rgcjonas.gmail.com" "dash-to-dock@micxgx.gmail.com" "search-light@icedman.github.com" "just-perfection-desktop@just-perfection" "clipboard-indicator@tudmotu.com" "caffeine@patapon.info"];
      favorite-apps = ["org.gnome.Nautilus.desktop" "firefox-nightly.desktop" "vesktop.desktop" "org.wezfurlong.wezterm.desktop" "com.spotify.Client.desktop" "steam.desktop"];
    };

    "org/gnome/shell/extensions/caffeine" = {
      indicator-position-max = 3;
      show-indicator = "always";
      toggle-state = false;
    };

    "org/gnome/shell/extensions/clipboard-indicator" = {
      toggle-menu = ["<Super>v"];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = false;
      background-opacity = mkDouble "0.0";
      custom-background-color = false;
      custom-theme-shrink = false;
      dash-max-icon-size = 48;
      dock-fixed = false;
      dock-position = "BOTTOM";
      height-fraction = mkDouble "0.9";
      middle-click-action = "launch";
      preferred-monitor = -2;
      preferred-monitor-by-connector = "HDMI-1";
      running-indicator-style = "DEFAULT";
      shift-click-action = "minimize";
      shift-middle-click-action = "launch";
      transparency-mode = "DEFAULT";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      activities-button = false;
      keyboard-layout = false;
      panel = true;
      quick-settings-dark-mode = false;
      window-demands-attention-focus = true;
    };

    "org/gnome/shell/extensions/search-light" = {
      background-color = mkTuple [(mkDouble "0.19607843458652496") (mkDouble "0.1882352977991104") (mkDouble "0.18431372940540314") (mkDouble "1.0")];
      blur-brightness = mkDouble "0.6";
      blur-sigma = mkDouble "30.0";
      currency-converter = true;
      entry-font-size = 1;
      monitor-count = 1;
      preferred-monitor = 0;
      scale-height = mkDouble "0.1";
      scale-width = mkDouble "0.1";
      shortcut-search = ["<Alt>space"];
      show-panel-icon = false;
      unit-converter = true;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Gruvbox-Pink-Dark-Medium";
    };

    "org/gnome/shell/keybindings" = {
      toggle-message-tray = [];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [(mkVariant (mkTuple [(mkUint32 2) (mkVariant (mkTuple ["Orlando" "KORL" true [(mkTuple [(mkDouble "0.4982284776050916") (mkDouble "-1.4195780857022569")])] [(mkTuple [(mkDouble "0.49808790878713594") (mkDouble "-1.4203356284107929")])]]))]))];
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [(mkTuple [(mkDouble "0.19607843458652496") (mkDouble "0.1882352977991104") (mkDouble "0.18431372940540314") (mkDouble "1.0")]) (mkTuple [(mkDouble "0.19607843458652496") (mkDouble "0.1882352977991104") (mkDouble "0.18431372940540314") (mkDouble "0.25")]) (mkTuple [(mkDouble "0.0") (mkDouble "0.0") (mkDouble "0.0") (mkDouble "0.25")])];
      selected-color = mkTuple [true (mkDouble "0.19607843458652496") (mkDouble "0.1882352977991104") (mkDouble "0.18431372940540314") (mkDouble "1.0")];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = false;
      sort-directories-first = false;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 197;
      sort-column = "modified";
      sort-directories-first = false;
      sort-order = "descending";
      type-format = "category";
      window-position = mkTuple [102 102];
      window-size = mkTuple [1203 902];
    };
  };
}
