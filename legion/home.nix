{ pkgs, ... }:
{
  imports = [
    ../modules/home/emacs.nix
    ../modules/home/fish.nix
    ../modules/home/mpv.nix
    ../modules/home/kitty.nix
    ../modules/home/nixvim.nix
    ../modules/home/yazi.nix
    # ../modules/home/ardour.nix Temporarily disabled due to build issues
    ../modules/home/hyprland.nix
    ../modules/home/obs.nix
    ../modules/home/vscode.nix
    ../modules/home/programming
    ../modules/home/awesomewm.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "suller";
  home.homeDirectory = "/home/suller";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Open source discord client
    vesktop
    # Password Manager
    keepassxc
    # Files syncing program
    syncthing
    # FOSS bittorrent client
    qbittorrent
    # Video Downloading programming
    yt-dlp
    # Minecraft launcher
    prismlauncher
    # Command-line tool to customize Spotify client
    spicetify-cli
    # Libre office program
    libreoffice
    nicotine-plus
    rhythmbox
    strawberry
    gimp
    kdePackages.kdenlive
    # Screenshot annotation tool
    satty
    tor-browser
    brave
    xournalpp
    tenacity
    dbeaver-bin
    google-chrome
    android-studio
    insomnia
    apktool
    httptoolkit
    godot
    anki
    postman
    picom
    xfce.thunar
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/suller/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
