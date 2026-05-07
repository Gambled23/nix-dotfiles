{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "ipog71@gmail.com";
        name = "Gambled23";
      };
    };
  };
}