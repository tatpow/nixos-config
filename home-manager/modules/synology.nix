{ pkgs, ... }:

let
  synology-fixed = pkgs.synology-drive-client.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ pkgs.makeWrapper ];
    
    postInstall = (old.postInstall or "") + ''
      wrapProgram $out/bin/synology-drive \
        --set QT_QPA_PLATFORM xcb
    '';
  });
in
{
  home.packages = [
    synology-fixed
  ];
}
