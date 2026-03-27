{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    installBatSyntax = true;
    installVimSyntax = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      cursor-click-to-move = true;
      theme = "Gruvbox Dark";
      background-opacity = 0.7;
      background-blur = false;
    };
  };
}