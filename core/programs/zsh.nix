{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    autocd = true;
    syntaxHighlighting.enable = true;

    shellGlobalAliases = {
      c = "clear";
      cat = "bat";
      cp = "cp -riv";
      lg = "lazygit";
      mkdir = "mkdir -vp";
      mv = "mv -iv";
      rm = "rm -riv";
      rebuild = "nixos-rebuild switch";
      ryujinx= "ryujinx -r /hdd/switchgames/data/";
    };
  };
}