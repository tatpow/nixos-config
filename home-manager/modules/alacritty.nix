{ lib, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1.0;

      font = {
        normal = {
          family = "JetBrains Mono";
          style = "Bold";
        };
        size = 13.0;
      };
    };
  };
}
