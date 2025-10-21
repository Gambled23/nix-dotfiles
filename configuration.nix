{ config, pkgs, lib, inputs, outputs, ... }:
let
theme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
in
{
  imports = [
    # Global services
    ./core/services/glances.nix
    ./core/services/mysql.nix
    ./core/services/openssh.nix
    ./core/programs/steam.nix
    ./core/services/syncthing.nix
    ./core/services/zerotier.nix

    # Desktop enviroment
    ./core/services/xserver/hyprland/hyprland.nix
    ./core/services/xserver/kde/default.nix
    #./core/services/xserver/gnome/default.nix
    #./core/services/xserver/i3/default.nix
    #./core/services/xserver/awesome/awesomewm.nix
  ];

  nix.settings.download-buffer-size = 524288000;

  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  security.polkit.enable = true;

  # set zsh shell
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  networking.networkmanager.enable = true;
  networking.extraHosts =
  ''
    192.168.1.1 router

    10.243.0.1 home-gambled
    10.243.0.2 pc-gambled
    10.243.0.3 laptop-gambled
    10.243.0.4 android-gambled
    10.243.0.5 windows-gambled
    10.243.0.6 steamdeck
    10.243.0.69 dev-gambled
  '';

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "es_ES.UTF-8";
  services.libinput.enable = true; # Enable touchpad support
  services.printing.enable = true; # Enable CUPS to print documents.

  # nix auto gc delete old generations
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  nix.settings.auto-optimise-store = true;

  # Enable sound with pipewire.
  #sound.enable = true;
  #hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };



  hardware.xone.enable = true;
  environment.systemPackages = with pkgs; [
    grub2
    (import ./scripts/nix-rbd.nix { inherit pkgs; })
    (import ./scripts/modo-tele.nix { inherit pkgs; })
    (import ./scripts/update-flake.nix { inherit pkgs; })
    (import ./scripts/auto-gc.nix { inherit pkgs; })
    (import ./scripts/git-clone.nix { inherit pkgs; })
    (import ./scripts/flash-kernelsu.nix { inherit pkgs; })
    (import ./scripts/dev/enviroment.nix { inherit pkgs; })
    (import ./scripts/dev/ssh-github.nix { inherit pkgs; })
    (import ./scripts/dev/migrateDB.nix { inherit pkgs; })
    (import ./scripts/dev/mysqlSetupRoot.nix { inherit pkgs; })
    (import ./scripts/dev/modular-prod-backup.nix { inherit pkgs; })
    (callPackage ./nixpkgs/pkgs/hayase/package.nix {})
    (callPackage ./nixpkgs/pkgs/stremio/package.nix {})
  ];

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  users.users = {
    gambled = {
      isNormalUser = true;
      description = "César Girón";
      extraGroups = [ "networkmanager" "wheel" "adbusers" "audio" "jackaudio"];
    };
  };

  # All sudo comands will be passwordless (I use this for home assistant)
  security.sudo.extraRules= [{
    users = [ "gambled" ];
    commands = [{
      command = "ALL";
      options= [ "NOPASSWD" ];
    }];
  }];



  # Extra services
  services.flatpak.enable = true; # Enable flatpak
  services.packagekit.enable = true; # Enable packagekit for gnome software
  services.fwupd.enable = true; # Enable firmware updates
  programs.adb.enable = true;

  # fonts.packages = with pkgs; [
  #   times-newer-roman
  #   noto-fonts
  #   noto-fonts-cjk-sans
  #   noto-fonts-emoji
  #   liberation_ttf
  #   fira-code
  #   fira-code-symbols
  #   mplus-outline-fonts.githubRelease
  #   dina-font
  #   proggyfonts
  #   nerd-fonts.noto
  #   nerd-fonts.ubuntu
  #   nerd-fonts.hack
  #   nerd-fonts.tinos
  #   nerd-fonts.arimo
  #   nerd-fonts.agave
  #   nerd-fonts.hasklug
  # ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.packageOverrides = pkgs: {
  #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
  #     inherit pkgs;
  #   };
  # };
  boot.tmp.useTmpfs = false;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}