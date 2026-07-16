{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    enableGitIntegration = true;
    quickAccessTerminalConfig = {
      background_opacity = 0.5;
      hide_on_focus_loss = true;
      start_as_hidden = true;
    };
  };
}