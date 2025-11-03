{ dwm 
, fetchFromGitHub
, kitty
, rofi
}:

dwm.overrideAttrs {
  src = fetchFromGitHub {
    owner = "Souheab";
    repo = "dwm";
    rev = "168ba1c9b9fff9974daaa660683c1bf3a78d7c6d";
    hash =  "sha256-hv1YWfPfU5aaKFMxHTo41reOgdrIZAR8QyXMrXTuBfw=";
  };

  postPatch = ''
  substituteInPlace config.h \
    --replace 'wezterm' '${kitty}/bin/kitty' \
    --replace 'rofi' '${rofi}/bin/rofi'
  '';
  passthru.updateScript = null;
}
