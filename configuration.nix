{ config, pkgs, lib, inputs, outputs, ... }:
{
  imports = [
    ./core/services/glances.nix
    ./core/services/openssh.nix
    ./core/services/syncthing.nix
    ./core/services/zerotier.nix
  ];

  nix = {
    settings = {
      download-buffer-size = 524288000;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      # cache for hyprland packages
      substituters = ["https://hyprland.cachix.org" "https://vicinae.cachix.org" ];
      trusted-substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

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

    10.243.0.1 server-gambled
    10.243.0.2 pc-gambled
    10.243.0.3 android-gambled
    10.243.0.4 dev-gambled
    10.243.0.10 home-gambled
  '';

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "es_ES.UTF-8";

  # Enable sound with pipewire.
  #sound.enable = true;
  #hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  hardware.xone.enable = true;
  environment.systemPackages = with pkgs; [
    grub2
    (import ./scripts/nix-rbd.nix { inherit pkgs; })
    (import ./scripts/update-flake.nix { inherit pkgs; })
    (import ./scripts/auto-gc.nix { inherit pkgs; })
    (import ./scripts/git-clone.nix { inherit pkgs; })
    (import ./scripts/dev/enviroment.nix { inherit pkgs; })
    (import ./scripts/dev/ssh-github.nix { inherit pkgs; })
    (import ./scripts/dev/migrateDB.nix { inherit pkgs; })
    (import ./scripts/dev/mysqlSetupRoot.nix { inherit pkgs; })
    (import ./scripts/dev/modular-prod-backup.nix { inherit pkgs; })
  ];

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  users.users = {
    gambled = {
      isNormalUser = true;
      description = "César Girón";
      extraGroups = [ "networkmanager" "wheel" "adbusers" "audio" "jackaudio" "dialout" "hass" ];
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
  services.packagekit.enable = true; # Enable packagekit for gnome software
  services.fwupd.enable = true; # Enable firmware updates
  programs.adb.enable = true;


  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.packageOverrides = pkgs: {
  #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
  #     inherit pkgs;
  #   };
  # };
  boot.tmp.useTmpfs = false;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.udev = {
    enable = true;
    # Dar permisos a dispositivos hidraw para headsetcontrol
    extraRules = 
      ''
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0666" 
      '';
  };
}