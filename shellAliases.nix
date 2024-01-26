{ config, pkgs, lib, ... }:

{
  programs = {
    command-not-found = {
      enable = false;
    };

    bash = {
      shellAliases = {
        ls = "lsd";
        la = "lsd -a";
        ll = "lsd -l";
        cat = "bat";
        cp = "cp -riv";
        mkdir = "mkdir -vp";
        mv = "mv -iv";
        rm = "rm -riv";
      };
    };
  };
}
