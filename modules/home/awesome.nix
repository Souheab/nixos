{pkgs, ...}:
{
  home.file.".xprofile".text = ''
    #!/bin/sh

    ${pkgs.picom}/bin/picom &
    ${pkgs.networkmanagerapplet}/bin/nm-applet &
  '';
}
