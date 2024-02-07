{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Gambled23";
    userEmail = "ipog71@gmail.com";
  };
}