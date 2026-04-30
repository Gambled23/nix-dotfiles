{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "26.05";
  imports = [
    ../../home.nix
    ./hyprland/dev.nix
    
    ../../core/programs/ghostty.nix
    # ../../core/programs/matugen.nix
  ];

  home.packages = with pkgs; [
    #* dev tools
    zed-editor-fhs
    vscode
    dbeaver-bin
    act3
    harlequin
    claude-code
    opencode
    bruno
    remmina
    android-tools
    # android-studio
    # jdk25_headless

    #* media
    vlc

    #* media creation
    gimp-with-plugins
    # inkscape-with-extensions

    #* messaging
    altus
    
    #* utils
    speedcrunch
    libreoffice
    scrcpy
    moonlight-qt
    siyuan
    # gnome-network-displays
    # stremio-linux-shell
    # inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default

    #* webbrowsers
    google-chrome
  ];

  services.flatpak.packages = [
    "com.stremio.Stremio"
    "com.artemchep.keyguard"
    "org.gnome.NetworkDisplays"
    "app.zen_browser.zen"
  ];
}
