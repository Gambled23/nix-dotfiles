{
  pkgs,
  alpha-server,
  ...
}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "26.05";
  imports = [
    ../../Machines/Core/home.nix
    ../../Machines/Desktop/home.nix
    ../../Features/Tools/Media/spotify-player.nix
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
    moonlight-qt
    (import "${alpha-server}/scripts/backup-alpha.nix" { inherit pkgs; })

    nchat # whatsapp cli
  ];
}
