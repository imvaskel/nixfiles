{...}: {
  homebrew = {
    enable = true;
    casks = [
      "jordanbaird-ice"
      "applite"
      "vlc"
      "keka"
      "kekaexternalhelper"
      "pearcleaner"
      "tailscale"
      "raycast"
      "discord"
      "spotify"
      "firefox"
      "1password"
      "eloston-chromium" # backup for when FF doesn't load stuff
    ];
    masApps = {
      "Amphetamine" = 937984704;
      "New File Menu Lite" = 1066302071;
    };
  };
}
