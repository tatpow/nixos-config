{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 45;
        modules-left = [ "custom/nixos" "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "hyprland/language"
          "network"
          "pulseaudio"
          "battery"
          "backlight"
          "clock"
          "tray"
        ];

        "custom/nixos" = {
          format = "󱄅"; # \udb84\udd05 - nixos logo
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          all-outputs = true;
          persistent-workspaces = {
            "*" = 10;
          };
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
          on-click = "activate";
        };

        "hyprland/language" = {
          format-en = "🇺🇸";
          format-ru = "🇷🇺";
          min-length = 5;
          tooltip = false;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}% ";
          format-muted = "";
          format-icons = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" ""];
          };
          on-click = "pavucontrol";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = ["" ""];
          on-scroll-up = "brightnessctl set 5%+";
          on-scroll-down = "brightnessctl set 5%-";
        };

        "network" = {
          format-wifi = " {signalStrength}%";
          format-ethernet = " ";
          format-disconnected = "";
          tooltip-format = "{essid} ({signalStrength}%)";
          tooltip-format-disconnected = "Disconnected";
          on-click = "nm-connection-editor";
        };

        "clock" = {
          format = "{:%d.%m.%Y - %H:%M}";
          format-alt = "{:%A, %B %d at %R}";
          on-click = "calendar";
        };

        "tray" = {
          icon-size = 14;
          spacing = 1;
        };
      };
    };
  };
}
