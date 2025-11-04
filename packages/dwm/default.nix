{ dwm 
, fetchFromGitHub
, kitty
, rofi
}:

dwm.overrideAttrs {
  src = fetchFromGitHub {
    owner = "Souheab";
    repo = "dwm";
    rev = "866f9748c7efbc6f1c2b9bd4dcb4c2cf96e97066";
    hash =  "sha256-7rpwh8pjJFhcEFftpgM7uPM+F5HPSDC/6VGoK6pT5nE=";
  };

  postPatch = ''
  substituteInPlace config.h \
    --replace 'wezterm' '${kitty}/bin/kitty' \
    --replace 'rofi' '${rofi}/bin/rofi'
  '';
  passthru.updateScript = null;
}
