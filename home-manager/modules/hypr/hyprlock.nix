{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      label = {
        text = "$TIME";
        font_size = 96;
        font_family = "JetBrains Mono";
        position = "0, 600";
        halign = "center";
        walign = "center";

        shadow_passes = 1;
      };

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          outline_thickness = 5;
          placeholder_text = "sussy baka";
          shadow_passes = 1;
        }
      ];
    };
  };
}
