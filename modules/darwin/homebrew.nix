{ ... }:
{
  homebrew = {
    enable = true;
    onActivation.upgrade = true;
    casks = [
      "jordanbaird-ice"
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
    ];
    masApps = {
      "Amphetamine" = 937984704;
    };
  };
}
