{ config, pkgs, ... }:
{

  imports = [
    ./modules/home/fish.nix
    ./modules/home/kitty.nix
    ./modules/home/wezterm.nix
    ./modules/home/dwm.nix
    ./modules/home/rofi.nix
  ];

  home.username = "suller";
  home.homeDirectory = "/home/suller";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    kdePackages.kate
    vscode-fhs
    winboat
    vesktop
    keepassxc
    gparted
    distrobox
    python315
    librewolf-bin
    rustdesk
    lazygit
    pavucontrol
    seahorse
    blueman
    spotify-player
    spotify
    eww
    xorg.xprop
    pamixer
    nerd-fonts.fira-code
  ];

}
