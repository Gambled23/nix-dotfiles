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
      lj = "lazyjournal";
      ls = "lsd";
      mkdir = "mkdir -vp";
      mv = "mv -iv";
      rm = "rm -riv";
      cd = "z";
      mdb = "mariadb -u root -p";
      noctalia-restart = "noctalia-shell kill; sleep 3; noctalia-shell -d";
      noctalia-config = "nix shell nixpkgs#json-diff -c bash -c \"json-diff <(jq -S . ~/.config/noctalia/settings.json) <(noctalia-shell ipc call state all | jq -S .settings)\"";
      gnome-control-center-fixed = "env XDG_CURRENT_DESKTOP=GNOME gnome-control-center";
    };
    
    initContent = "
      source <(fzf --zsh)\n
      eval $(zoxide init zsh)\n
    ";
  };
}