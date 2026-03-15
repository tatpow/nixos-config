{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    
    settings = {
      # Enviroment settings
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,36"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
      ];

      # Monitor configuration
      monitor = ",1920x1080@60,auto,1";

      # Variables
      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
            
      #"$fileManager" = "$terminal -e sh -c 'ranger'";
      "$menu" = "wofi";


      exec-once = [
        #"waybar"
        #"wl-paste --type text --watch cliphist store"
        #"wl-paste --type image --watch cliphist store"
      ];
      
      # Gestures

      gesture = [
        "3, horizontal, workspace"
        "2, pinch, mod: SUPER, fullscreen"
      ];

      # Window layout
      general = {
        resize_on_border = true;
        layout = "master";
      };

      decoration = {};

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      # Keyboard layout
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:caps_toggle";
        follow_mouse = 0;
      };

      cursor = {
        no_warps = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave";
        new_on_top = true;
        mfact = 0.5;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
  };
}
