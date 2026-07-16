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
      ssh = "kitten ssh";
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
      mdb = "mariadb -h 127.0.0.1 -u root -p";
      noctalia-restart = "noctalia-shell kill; sleep 3; noctalia-shell -d";
      # noctalia-config = "nix shell nixpkgs#json-diff -c bash -c \"json-diff <(jq -S . ~/.config/noctalia/settings.json) <(noctalia-shell ipc call state all | jq -S .settings)\"";
      noctalia-config = "nix run github:erooke/toml2nix -- -p noctalia-config.toml -o ./noctalia.nix";
      gnome-control-center-fixed = "env XDG_CURRENT_DESKTOP=GNOME gnome-control-center";
    };
    
    initContent = ''
      source <(fzf --zsh)
      eval $(zoxide init zsh)
      eval "''$(devenv hook zsh)"
    '';
  };
}
