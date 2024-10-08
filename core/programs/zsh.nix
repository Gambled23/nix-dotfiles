{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;

    shellGlobalAliases = {
      c = "clear";
      cat = "bat";
      cp = "cp -riv";
      gitfix = "git fetch origin main && git diff --exit-code origin/main";
      lg = "lazygit";
      mkdir = "mkdir -vp";
      mv = "mv -iv";
      rm = "rm -riv";
      
    };
    initExtra = "source <(fzf --zsh)\n";
  };
}