{ config, pkgs, ... }: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
    };
    mouse = {
      naturalScrolling = false; # Reminder: Mouse natural scrolling being false is what you're used to
    };
  };
}
