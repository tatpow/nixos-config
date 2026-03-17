{
  programs.chromium = {
    enable = true;
    extensions = [
      # Bitwarden
      { id = "nngceckbapebfimnlniiiahkandclblb"; }

      # Simple Translate
      { id = "ibplnjkanclpjokhdolnendpplpjiace"; }

      # Return YouTube Dislike
      { id = "gebbhagfogifgggkldgodflihgfeippi"; }
    ];
  };
}
