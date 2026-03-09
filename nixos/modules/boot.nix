{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [
    "nowatchdog"
    "pcie_aspm=off"
    "usbcore.autosuspend=-1"
    "acpi_osi=Linux"
  ];
  boot.blacklistedKernelModules = [ "iTCO_wdt" "iTCO_vendor_support" ];

  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
    RuntimeWatchdogSec = "0";
    ShutdownWatchdogSec = "0";
  };
}
