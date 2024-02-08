{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.lsd = {
    enable = true;
    settings = {
      hyperlink = "auto";
      header = true;
    };
  };
}