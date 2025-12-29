args@{ pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    dpi = 82;
    windowManager.awesome = {
      enable = true;
      # Use the awesome package exported by the external flake instead of an overlay/override
      package = args."awesome-flake".packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };

  services.displayManager.defaultSession = "none+awesome";

  environment.systemPackages = with pkgs; [
    pamixer
    acpilight
  ];
}
