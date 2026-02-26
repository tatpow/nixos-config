{ pkgs, ... }: {
  users.users.tatpow = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "input" ];
  };
}
