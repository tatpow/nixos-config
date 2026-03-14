{ lib, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1.0;

      font = {
        normal = {
           style = lib.mkForce "Bold";
        };
      };
    };
  };
}
