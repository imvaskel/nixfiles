{ pkgs, home-manager, lib, ... }:

{
  home.packages = with pkgs; [
    git
    ripgrep
    # optional dependencies
    coreutils # basic GNU utilities
    fd
    clang
  ];
  home.sessionPath = [ "$HOME/.config/emacs/bin" ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  home.file.".config/doom" = {
    recursive = true;
    source = ./doom;
    onChange = ''
      #!/bin/sh

      DOOM=$XDG_CONFIG_HOME/emacs

      if [ ! -d "$DOOM" ]; then
        git clone https://github.com/doomemacs/doomemacs $DOOM
        $DOOM/bin/doom -y install
      fi

      $DOOM/bin/doom sync
    '';
  };

  home.activation = {
    installDoomEmacs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -d "$XDG_CONFIG_HOME/emacs" ]; then
         ${pkgs.git}/bin/git clone --depth=1 --single-branch "https://github.com/doomemacs/doomemacs" "$XDG_CONFIG_HOME/emacs"
      fi
    '';
  };
}
