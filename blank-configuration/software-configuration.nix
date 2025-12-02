{ config, pkgs, ... }:
{
  services.xserver.enable = false;
  services.openssh.enable = true;

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
