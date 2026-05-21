{ config, pkgs, lib, inputs, outputs, ... }:
{
  imports = [
    ../../Features/Network/openssh.nix
    ../../Features/Network/syncthing.nix
    ../../Features/Network/zerotier.nix

    ../../Cachix/cachix.nix
  ];

  nix = {
    settings = {
      trusted-users = [ "root" "gambled" ];
      download-buffer-size = 524288000;
      auto-optimise-store = true;
      experimental-features = [ 
        "nix-command" 
        "flakes" 
        "pipe-operators"
      ];      
    };
  };

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  networking.networkmanager.enable = true;
  networking.extraHosts =
  ''
    192.168.1.1 router

    10.243.0.1 server-gambled
    10.243.0.2 pc-gambled
    10.243.0.3 android-gambled
    10.243.0.4 dev-gambled
    10.243.0.5 steamdeck
  '';

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  time.timeZone = "America/Mexico_City";

  # Enable sound with pipewire.
  #sound.enable = true;
  #hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  # security.polkit.enable = lib.mkForce false;

  hardware.xone.enable = true;
  environment.systemPackages = with pkgs; [
    cachix.bin
    grub2
    nixd
    nil
    (import ../../Scripts/nix-rbd.nix { inherit pkgs; })
    (import ../../Scripts/update-flake.nix { inherit pkgs; })
    (import ../../Scripts/auto-gc.nix { inherit pkgs; })
    (import ../../Scripts/git-clone.nix { inherit pkgs; })

    (import ../../Scripts/dev/enviroment.nix { inherit pkgs; })
    (import ../../Scripts/dev/ssh-github.nix { inherit pkgs; })
    (import ../../Scripts/dev/migrateDB.nix { inherit pkgs; })
    (import ../../Scripts/dev/mariadbSetupRoot.nix { inherit pkgs; })
  ];

  users.users = {
    gambled = {
      isNormalUser = true;
      description = "César Girón";
      extraGroups = [ "networkmanager" "wheel" "adbusers" "audio" "jackaudio" "dialout" "hass" "i2c" "root"];
    };
  };
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # All sudo comands will be passwordless (I use this for home assistant)
  security.sudo.extraRules= [{
    users = [ "gambled" ];
    commands = [{
      command = "ALL";
      options= [ "NOPASSWD" ];
    }];
  }];


  # Extra services
  services.fwupd.enable = true; # Enable firmware updates

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.packageOverrides = pkgs: {
  #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
  #     inherit pkgs;
  #   };
  # };

  services.udev = {
    enable = true;
    # Dar permisos a dispositivos hidraw para headsetcontrol
    extraRules =
      ''
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0666"
      '';
  };

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  programs.nix-index-database.comma.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos"; # sets NH_OS_FLAKE variable for you
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  environment.variables = {
    EDITOR = "vim";
    SHELL = "zsh";
  };

  programs.dconf.enable = true;

  programs.pay-respects = {
    enable = true;
  };
}
