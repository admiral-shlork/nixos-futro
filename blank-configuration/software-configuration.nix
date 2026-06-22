{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "pl";
        variant = "";
      };
    };
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    udev.packages = with pkgs; [ gnome-settings-daemon ];
    fprintd.enable = true;
    power-profiles-daemon.enable = true;
    prometheus.exporters.node = {
      enable = true;
      port = 9000;
      enabledCollectors = [
        "cpu"
        "cpufreq"
        "diskstats"
        "ethtool"   
        "filesystem"
        "hwmon"
        "loadavg"
        "meminfo"
        "nvme"
        "os"
        "softirqs"
        "systemd"
        "vmstat"
      ];
      extraFlags = [ "--collector.ntp.protocol-version=4" "--no-collector.mdadm" ];
    };
  };

  environment.systemPackages = with pkgs; [
    adguardhome
    btop
    docker
    git
    home-manager
    htop
    nh
    python3
    screen
    vim
    wget
  ];

  systemd.services.prometheus-node-exporter.serviceConfig = {
    RestrictNamespaces = lib.mkForce false;
    ProtectHome = lib.mkForce false;
  };
}
