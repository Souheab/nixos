{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
     jetbrains-mono
     lexend
     noto-fonts
     emacs-all-the-icons-fonts
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
