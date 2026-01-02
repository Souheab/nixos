{ pkgs, lib }:
let
  sgbar = pkgs.callPackage ./sgbar { };
  callPackage = pkgs.callPackage;
in
{
  inherit sgbar;
  dwm = callPackage ./dwm { };
  btremacsd-nix = callPackage ./btremacsd-nix { };
  # nordvpn-bin = callPackage ./nordvpn-bin { };
}
