{
  pkgs,
  inputs,
  alpha-server,
  ...
}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "26.05";
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ../../Machines/Core/home.nix
    ../../Machines/Desktop/home.nix
    #../../Features/Tools/Media/spotify-player.nix            
  ];

  home.packages = with pkgs; [
    #* dev tools
    nodejs_26
    bruno
    awscli
    remmina
    mariadb
    # android-studio
    # jdk25_headless

    #* utils
    # moonlight-qt
    (import "${alpha-server}/scripts/backup-alpha.nix" { inherit pkgs; })
    (import "${alpha-server}/scripts/dev/start-cng-plus.nix" { inherit pkgs; })
    (import "${alpha-server}/scripts/dev/stop-cng-plus.nix" { inherit pkgs; })

    nchat # whatsapp cli
  ];
}
