{ config, pkgs, mypkgs, ... }:
{

  imports = [
    ./modules/home/fish.nix
    ./modules/home/kitty.nix
    ./modules/home/wezterm.nix
    ./modules/home/dwm.nix
    ./modules/home/rofi.nix
    ./modules/home/yazi.nix
    ./modules/home/nsxiv.nix
    ./modules/home/nixvim.nix
    ./modules/home/awesome.nix
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

  programs.zathura = {
    enable = true;
  };

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "polkit-gnome-authentication-agent-1";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };


  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/x-extension-htm" = "firefox.desktop";
      "application/x-extension-html" = "firefox.desktop";
      "application/x-extension-shtml" = "firefox.desktop";
      "application/x-extension-xht" = "firefox.desktop";
      "application/x-extension-xhtml" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "image/png" = "nsxiv-2.desktop";
      "image/jpeg" = "nsxiv-2.desktop";
      "image/gif" = "nsxiv-2.desktop";
      "image/webp" = "nsxiv-2.desktop";
      "image/*" = "nsxiv-2.desktop";
      "text/html" = "firefox.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "x-scheme-handler/discord" = "vesktop.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
    };
  };

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
    networkmanagerapplet
    obs-studio
    mpv
    alpaca
    fabric-ai
    xfce.thunar
    xfce.tumbler
    deluge
    logseq
    android-studio
    gimp3-with-plugins
    opencode
    zoxide
    emacs
    imagemagick
    taskwarrior2
    taskwarrior-tui
    ani-cli
    xournalpp
    texlive.combined.scheme-full
    flameshot
    libreoffice-qt6-fresh
    pngtools
    qdirstat
    kdePackages.kdenlive
  ];

}
