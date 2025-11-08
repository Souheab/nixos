{pkgs, mypkgs, ...}:
{
  imports = [
    ./picom.nix
  ];

  home.file.".config/dwm/startup.sh" = {
    executable = true;
    text = ''
    #!/bin/sh
    ${pkgs.feh}/bin/feh --bg-scale ~/.config/dwm/wp.jpg &
    ${pkgs.eww}/bin/eww open bar --screen 0 &
    ${pkgs.picom}/bin/picom &
    ${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &
    '';
  };
}
