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
      ls = "lsd";
      mkdir = "mkdir -vp";
      mv = "mv -iv";
      rm = "rm -riv";
      cd = "z";
      mdb = "mariadb -u root -p";
      noctalia = "noctalia-shell kill && konsole -e noctalia-shell -d";
    };
    
    initContent = "source <(fzf --zsh)\n
    eval $(zoxide init zsh)\n
    ";
  };
}