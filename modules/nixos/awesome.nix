{ pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    dpi = 82;
    windowManager.awesome = {
      enable = true;
      package = pkgs.awesome.overrideAttrs (oldAttrs: {
        pname = "awesome-git";
        version = "392dbc2";

        src = pkgs.fetchFromGitHub {
          owner = "awesomeWM";
          repo = "awesome";
          rev = "392dbc2";
          sha256 = "sha256:093zapjm1z33sr7rp895kplw91qb8lq74qwc0x1ljz28xfsbp496";
        };

        patches = [];

        cmakeFlags = lib.filter (flag: !(lib.hasPrefix "-DOVERRIDE_VERSION" flag)) oldAttrs.cmakeFlags;
      });
    };
  };

  environment.systemPackages = with pkgs; [
    pamixer
    acpilight
  ];
}