{ config, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi.override {
      _7zz = pkgs._7zz-rar;
    };
    plugins = {
      relative-motions = pkgs.yaziPlugins.relative-motions;
      smart-enter = pkgs.yaziPlugins.smart-enter;
    };
  };
}