{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "nowatchdog" ];
  boot.blacklistedKernelModules = [ "iTCO_wdt" "iTCO_vendor_support" ];

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
    RuntimeWatchdogSec=0
    ShutdownWatchdogSec=0
  '';
}
