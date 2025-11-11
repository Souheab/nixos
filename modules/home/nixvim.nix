{ pkgs, nixvim, system, ... }:
{
  home.packages = [
    nixvim.packages.${system}.default
    # TODO: Find a way to introduce these dependencies directly into the nvim flake
    pkgs.wl-clipboard
    pkgs.xclip
  ];
}