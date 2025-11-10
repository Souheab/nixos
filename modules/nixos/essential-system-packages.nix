{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    btop
    htop
    neofetch
    efibootmgr
    fzf
    ripgrep
    fd
    tealdeer
    killall
    gnumake
    nix-index
  ];
}
