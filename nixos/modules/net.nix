{ pkgs, ... }: {
  hardware.enableRedistributableFirmware = true;

  programs.nm-applet.enable = true;
  programs.captive-browser = {
    enable = true;
    interface = "wlo1";
  };
  networking.networkmanager = {
    enable = true;
    settings = {
      connectivity = {
        uri = "http://nmcheck.gnome.org/check_network_status.txt";
        interval = 300;
      };
    };
  };
}
