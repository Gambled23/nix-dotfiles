{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.lsd = {
    enable = true;
    enableAliases = true;
    settings = {
      hyperlink = "auto";
      header = true;
    };
  };
}