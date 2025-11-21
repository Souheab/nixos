{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
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
    xclip
    yt-dlp
    ffmpeg
    gcc
    file
  ];
}
