{
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
  
  boot.kernelModules = [ "tun" ];
  networking.firewall.checkReversePath = "loose";
}
