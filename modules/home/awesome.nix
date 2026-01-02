{ pkgs, mypkgs, ... }:
{
  imports = [ ./sxhkd.nix ];

  home.file.".xprofile".text = ''
    #!/bin/sh

    ${pkgs.sxhkd}/bin/sxhkd &
    ${pkgs.picom}/bin/picom &
    ${pkgs.networkmanagerapplet}/bin/nm-applet &
    ${pkgs.flameshot}/bin/flameshot &
    ${mypkgs.btremacsd-nix}/bin/btremacsd-nix -r &
  '';
}
