{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = builtins.readFile ./init.lua;
    viAlias = true;
    vimAlias = true;
    plugins = [pkgs.vimPlugins.packer-nvim];
  };

  home.packages = with pkgs; [
    fzf
  ];

  home.file.".config/nvim/lua".source = ./lua;
}
