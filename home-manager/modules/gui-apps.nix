{ pkgs, ... }: {
  home.packages = with pkgs; [
    (telegram-desktop.override {
      extraEnv = {
        QT_QPA_PLATFORM = "xcb";
      };
    })

    # Обёртка для Synology Drive Client
    (synology-drive-client.overrideAttrs (old: {
      nativeBuildInputs = (old.nativeBuildInputs or []) ++ [
        makeWrapper
      ];
      postFixup = (old.postFixup or "") + ''
        wrapProgram $out/bin/synology-drive \
          --set QT_QPA_PLATFORM xcb \
          --set QT_AUTO_SCREEN_SCALE_FACTOR 1
      '';
    }))
  ];
}
