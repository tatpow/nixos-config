{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager  # Для команды 'home-manager switch' после установки
  ];
}
