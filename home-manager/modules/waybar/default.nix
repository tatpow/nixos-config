{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        modules-left = [ "custom/nixos" "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "hyprland/language" 
          "bluetooth"
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

        "bluetooth" = {
          format = "󰂯 On";
          format-disabled = "󰂲 Dis";
          format-off = "󰂲 Off";
          format-connected = "󰂱 Connected";

          tooltip-format = "Status: {status}";
          tooltip-format-connected = "Connected to {device_alias}";

          on-click = "blueman-manager";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}% ";
          format-muted = " Muted";
          format-icons = {
            "headphone" = "";
            "hands-free" = "";
            "default" = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        "battery" = {
          states = {
            warning = 40;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-icons = ["" "" "" "" ""];
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = ["󰃚" "󰃛" "󰃜" "󰃝" "󰃞" "󰃟" "󰃠"];
          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";
        };

        "network" = {
          format-wifi = "{icon} {essid}";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          format-ethernet = "󰈀 Eth";
          format-disconnected = "󰤮 Offline";
          tooltip-format = "{signalStrength}%";
          tooltip-format-disconnected = "Disconnected";
          on-click = "nm-connection-editor";
        };

        "clock" = {
          format = "{:%d.%m.%Y - %H:%M}";
          format-alt = "{:%A, %B %d at %R}";
          tooltip = false;
        };

        "tray" = {
          icon-size = 20;
          spacing = 2;
        };
      };
    };
  };
}
