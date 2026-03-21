{ pkgs, ... }: {
  programs.vscode = {
    enable = true;

    package = pkgs.vscode;

    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      pkief.material-icon-theme
      jnoortheen.nix-ide
    ];

    userSettings = {
      "chat.disableAIFeatures" = true;
      "http.systemCertificatesNode" = true;
      "workbench.colorTheme" = "Dracula Theme";
      "editor.fontFamily" = "'Symbols Nerd Font', 'JetBrains Mono'";
      "editor.fontSize" = 16;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.tree.indent" = 14;
      "explorer.confirmDragAndDrop" = true;
      "explorer.confirmDelete" = true;
      "window.zoomLevel" = 1;
      "breadcrumbs.enabled" = false;
      "editor.multiCursorModifier" = "ctrlCmd";
      "editor.cursorBlinking" = "smooth";
      "workbench.startupEditor" = "none";
      "workbench.tips.enabled" = false;
      "editor.lineNumbers" = "on";
      "workbench.statusBar.visible" = false;
      "chat.commandCenter.enabled" = false;
      "workbench.layoutControl.enabled" = false;
      "workbench.tree.renderIndentGuides" = "none";
      "editor.renderLineHighlight" = "none";
      "files.autoSave" = "afterDelay";
      "update.mode" = "none";
      "extensions.ignoreRecommendations" = true;
      "editor.guides.indentation" = false;
      "editor.showFoldingControls" = "mouseover";
      "files.insertFinalNewline" = true;
      "explorer.decorations.badges" = false;
      "git.decorations.enabled" = false;
      "scm.diffDecorations" = "none";
      "editor.parameterHints.enabled" = false;
      "editor.hover.enabled" = false;
      "files.trimTrailingWhitespace" = false;
      "editor.links" = false;
      "workbench.tree.enableStickyScroll" = false;
      "editor.stickyScroll.enabled" = false;
      "editor.hideCursorInOverviewRuler" = true;
      "editor.overviewRulerBorder" = false;
      "editor.minimap.enabled" = false;
      "workbench.colorCustomizations" = {
        "editorCursor.background" = "#000000";
        "editorOverviewRuler.wordHighlightStrongForeground" = "#0000";
        "editorOverviewRuler.selectionHighlightForeground" = "#0000";
        "editorOverviewRuler.rangeHighlightForeground" = "#0000";
        "editorOverviewRuler.wordHighlightForeground" = "#0000";
        "editorOverviewRuler.bracketMatchForeground" = "#0000";
        "editorOverviewRuler.findMatchForeground" = "#0000";
        "editorOverviewRuler.modifiedForeground" = "#0000";
        "editorOverviewRuler.deletedForeground" = "#0000";
        "editorOverviewRuler.warningForeground" = "#0000";
        "editorOverviewRuler.addedForeground" = "#0000";
        "editorOverviewRuler.errorForeground" = "#0000";
        "editorOverviewRuler.infoForeground" = "#0000";
        "editorOverviewRuler.border" = "#0000";
      };
      "editor.smoothScrolling" = true;
      "editor.cursorSmoothCaretAnimation" = "on";
      "workbench.list.smoothScrolling" = true;
      "terminal.integrated.smoothScrolling" = true;
      "editor.wordWrap" = "on";
      "workbench.editor.empty.hint" = "hidden";
      "javascript.updateImportsOnFileMove.enabled" = "always";
    };
  };

  xdg.desktopEntries = {
    code = {
      name = "Visual Studio Code";
      comment = "Code Editing. Redefined.";
      genericName = "Text Editor";
      exec = "code %F";
      icon = "code";
      type = "Application";
      categories = [ "Development" "TextEditor" "Utility" ];
      mimeType = [
        "text/plain"
        "inode/directory"
        "application/x-code-workspace"
      ];
      settings = {
        Keywords = "vscode;code;editor";
        StartupNotify = "true";
        StartupWMClass = "code";
      };
    };
  };
}
