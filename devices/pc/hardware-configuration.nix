# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/boot" =
    { #device = "/dev/disk/by-uuid/2ba98801-a0e3-2740-b850-1ea0a4315070";
      device = "/dev/disk/by-uuid/FE4A-E5D7";
      
      fsType = "vfat";
    };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/6c21ad58-5ba1-4270-86a6-8fa1d7cec7d5";
      #device = "/dev/disk/by-label/root";
      fsType = "ext4";
    };

  fileSystems."/home/gambled" =
    { device = "/dev/disk/by-label/home";
      fsType = "ext4";
    };


  fileSystems."/windows" =
    { device = "/dev/disk/by-uuid/8AC2BD6EC2BD5F5F";
      #device = "/deb/disk/by-label/Windows";
      fsType = "ntfs";
      options = [ "rw" "uid=1000"];
    };

  fileSystems."/games" =
    { #device = "/dev/disk/by-uuid/46F24542F2453807";
      device = "/dev/disk/by-label/Games";
      fsType = "ntfs";
      options = [ "rw" "uid=1000"];
    };

  fileSystems."/hdd" =
    { #device = "/dev/disk/by-uuid/868E593D8E5926C9";
      device = "/dev/disk/by-label/HDD";
      fsType = "ntfs"; 
      options = [ "rw" "uid=1000"];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/360aa2dd-84ce-42a0-b8f4-2e59dfba5448"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}