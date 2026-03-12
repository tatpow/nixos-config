{ pkgs, ... }: {
  # Hyprland Wayland compositor
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  
  # Screen locker
  security.pam.services.hyprlock = {};
  
  # Display Manager - graphical login
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  
  # XDG Portal for Wayland
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
}
