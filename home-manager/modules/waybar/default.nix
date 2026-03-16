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
        modules-center = [];
        # modules-right = ["hyprland/language" "custom/weather" "pulseaudio" "battery" "clock" "tray"];

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
            "1" = "󰬺";
            "2" = "󰬻";
            "3" = "󰬼";
            "4" = "󰬽";
            "5" = "󰬾";
            "6" = "󰬿";
            "7" = "󰭀";
            "8" = "󰭁";
            "9" = "󰭂";
            "10" = "󰿩";
          };
          on-click = "activate";
        };

        # "hyprland/language" = {
        #   format-en = "🇺🇸";
        #   format-ru = "🇷🇺";
        #   min-length = 5;
        #   tooltip = false;
        # };

        # "custom/weather" = {
        #   format = " {} ";
        #   exec = "curl -s 'https://wttr.in/Moscow?format=%c%t'";
        #   interval = 300;
        #   class = "weather";
        # };

        # "pulseaudio" = {
        #   format = "{icon} {volume}%";
        #   format-bluetooth = "{icon} {volume}% ";
        #   format-muted = "";
        #   format-icons = {
        #     "headphones" = "";
        #     "handsfree" = "";
        #     "headset" = "";
        #     "phone" = "";
        #     "portable" = "";
        #     "car" = "";
        #     "default" = ["" ""];
        #   };
        #   on-click = "pavucontrol";
        # };

        # "battery" = {
        #   states = {
        #     warning = 30;
        #     critical = 1;
        #   };
        #   format = "{icon} {capacity}%";
        #   format-charging = " {capacity}%";
        #   format-alt = "{time} {icon}";
        #   format-icons = ["" "" "" "" ""];
        # };

        # "clock" = {
        #   format = "{:%d.%m.%Y - %H:%M}";
        #   format-alt = "{:%A, %B %d at %R}";
        # };

        # "tray" = {
        #   icon-size = 14;
        #   spacing = 1;
        # };
      };
    };
  };
}
