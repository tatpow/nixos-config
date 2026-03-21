{
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

  networking.firewall.trustedInterfaces = [ "throne-tun" ];
  
  boot.kernelModules = [ "tun" ];
  networking.firewall.checkReversePath = "loose";
}
