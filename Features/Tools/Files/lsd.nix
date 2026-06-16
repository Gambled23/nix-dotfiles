{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.lsd = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      hyperlink = "auto";
      header = true;
    };
  };
}