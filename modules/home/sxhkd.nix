{ config, pkgs, ... }:
let
  screenshotsDir = "${config.home.homeDirectory}/Pictures/Screenshots";
in
{
  services.sxhkd.enable = true;
  services.sxhkd.keybindings = {
    "Print" = "${pkgs.flameshot}/bin/flameshot screen -p ${screenshotsDir} -c";
    "super + shift + {s,a}" = "${pkgs.flameshot}/bin/flameshot {gui -c, gui}";
    "alt + {d,e}" = "{${pkgs.vesktop}/bin/vesktop, ${pkgs.emacs}/bin/emacsclient -c}";
  };
}
