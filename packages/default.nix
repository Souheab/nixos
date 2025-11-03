{ pkgs, lib }:
let
  sgbar = pkgs.callPackage ./sgbar { };
  callPackage = pkgs.callPackage;
in
{
  inherit sgbar;
  dwm = callPackage ./dwm { };
  # nordvpn-bin = callPackage ./nordvpn-bin { };
}
