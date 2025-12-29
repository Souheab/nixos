{ pkgs, ... }:
{
  imports = [ ./sxhkd.nix ];

  home.file.".xprofile".text = ''
    #!/bin/sh

    ${pkgs.sxhkd}/bin/sxhkd &
    ${pkgs.picom}/bin/picom &
    ${pkgs.networkmanagerapplet}/bin/nm-applet &
  '';
}
