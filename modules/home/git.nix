{ ... }:
let
  configDir = "~/.config/git";
in
{
  programs = {
    lazygit.enable = true;
    git = {
      enable = true;
      userName = "ImVaskel";
      userEmail = "49348256+ImVaskel@users.noreply.github.com";
      includes = [
        {
          path = "${configDir}/config.local";
        }
      ];
      delta = {
        enable = true;
        options = {
          navigate = true;
        };
      };
      extraConfig = {
        core = {
          autoclrf = false;
          ignorecase = true;
        };
        merge.conflictstyle = "diff3";
        diff.colorMoved = "default";
        color.ui = "auto";
        init.defaultBranch = "main";
        help.autocorrect = 20;
        push = {
          default = "current";
          autoSetupRemote = true;
          followTags = true;
        };
        pull.ff = "only";
        url."git@github.com:" = {
          pushInsteadOf = "https://github.com";
          insteadOf = "gh:";
        };
      };
      aliases = {
        acp = "! acp() { [ -z $1 ] && echo 'acp: error: file argument required' && exit 1 || git ac $@ && git push; }; acp";
        ac = "! ac() { [ -z $1 ] && echo 'ac: error: file argument required' && exit 1 || git add $@ && git commit; }; ac";
      };
      ignores = [
        ".venv/"
        "venv/"
        ".DS_Store"
        ".idea/"
        ".vscode"
        "__pycache__"
      ];
    };
  };
}
