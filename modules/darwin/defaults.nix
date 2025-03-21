{ ... }:
{
  system.defaults = {
    dock = {
      tilesize = 52;
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.25;
    };
    finder = {
      _FXSortFoldersFirst = true;
      FXEnableExtensionChangeWarning = false;
      NewWindowTarget = "Home";
      AppleShowAllExtensions = true;
      QuitMenuItem = true;
    };
    NSGlobalDomain = {
      NSDocumentSaveNewDocumentsToCloud = false;
      NSTableViewDefaultSizeMode = 2;
    };
    loginwindow.GuestEnabled = false;
    CustomUserPreferences = {
      "com.apple.finder" = {
        ShowHardDrivesOnDesktop = false;
        ShowExternalHardDrivesOnDesktop = false;
        ShowMountedServersOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
        ShowRecentTags = false;
        FXRemoveOldTrashItems = true;
      };
    };
  };
}
