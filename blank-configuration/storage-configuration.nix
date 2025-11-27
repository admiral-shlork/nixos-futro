{ config, pkgs, modulesPath, ... }:

{
  boot = {
    initrd.availableKernelModules = [ "ahci" "xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
    initrd.kernelModules = [ "dm-snapshot" ];
    kernelModules = [ "kvm-intel" ];
    kernelPackages = [ ];kernelParams = [ ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # swapDevices = [{
  #     device = "/swapfile";
  #     size = 64 * 1024;
  #   }];

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  
  fileSystems."/" =
    { device = "/dev/disk/by-label/root";
      fsType = "ext4";
    };
}
