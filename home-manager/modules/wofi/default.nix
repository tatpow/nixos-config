{
  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      allow_images = true;
      width = 450;
      height = 550;
    };
  };

  #home.file.".config/wofi/style.css".source = ./style.css;
}
