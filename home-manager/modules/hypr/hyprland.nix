{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    
    settings = {
      # Variables
      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      
      # Monitor configuration
      monitor = ",highres,auto,1";
      
      # Keyboard layout
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:caps_toggle";
      };
      
      # Window layout
      general = {
        layout = "master";
      };
    };
  };
}
