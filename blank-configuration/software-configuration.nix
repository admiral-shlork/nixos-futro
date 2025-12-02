{ config, pkgs, ... }:
{
  services.xserver.enable = false;
  services.openssh.enable = true;
  services.adguardhome = {
    enable = true;
    host = "0.0.0.0";
    port = 3000;
  };

  environment.systemPackages = with pkgs; [
    adguardhome
    git
    home-manager
    htop
    nh
    screen
    vim
    wget
  ];
}
