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
      
      # Key bindings
      bind = [
        # Terminal
        "$mainMod, RETURN, exec, $terminal"
        
        # Close window
        "$mainMod, Q, killactive,"
        
        # Toggle floating
        "$mainMod, F, togglefloating,"
        
        # App launcher
        "$mainMod, D, exec, wofi --show drun"
        
        # Exit Hyprland
        "$mainMod SHIFT, Q, exit,"
        
        # Screen lock
        "$mainMod, L, exec, hyprlock"
        
        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
      ];
      
      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
