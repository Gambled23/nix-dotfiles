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
      background-opacity = 0.6;
      background-blur = false;
      confirm-close-surface = false;
      shell-integration-features = true;
      keybind = [
        "ctrl+backspace=text:\\x17"
      ];
    };
  };
}
