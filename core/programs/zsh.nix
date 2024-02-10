{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
        "thefuck"
      ];
      theme = "eastwood";
    };

    shellAliases = {
      ls = "lsd";
      la = "lsd -a";
      ll = "lsd -l";
      cat = "bat";
      cp = "cp -riv";
      mkdir = "mkdir -vp";
      mv = "mv -iv";
      rm = "rm -riv";
      rebuild = "nixos-rebuild switch";
      code = "code";
      ryujinx= "ryujinx -r /hdd/switchgames/data/";
    };
  };
}