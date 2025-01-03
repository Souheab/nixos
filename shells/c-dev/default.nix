# A maximalist shell for C programming
{ pkgs, pkgs-stable }:

pkgs.mkShell {
  packages = with pkgs; [
    pkg-config
    pkgs-stable.bear
    gcc
    gdb
    gnumake
    cmake
    gtk3
    gtk4
    glib
    xorg.libX11
    xorg.libXinerama
    xorg.libXft
    xorg.xorgserver
    libpulseaudio
    networkmanager
  ];
}
