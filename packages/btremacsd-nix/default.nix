{ stdenv, xdotool, emacs, xorg, lib }:

stdenv.mkDerivation rec {
  pname = "btremacsd-nix";
  version = "1.0";

  src = null;
  dontUnpack = true;

  # Script only; pull runtime deps so the user can run it directly.
  dontBuild = true;
  buildInputs = [ xdotool emacs xorg.xorgserver ];

  installPhase = ''
    mkdir -p "$out/bin"
    cat > "$out/bin/btremacsd-nix" <<'EOF'
#!/bin/bash
# Note: btremacsd = Better Emacs Daemon

start_daemon() {
  Xvfb :99 -screen 0 1920x1080x24 & DISPLAY=:99 EMACS_START_SERVER=t SHELL=/bin/sh emacs &
}

kill_daemon() {
  killall Xvfb
  kill $(xdotool getwindowpid $(xdotool search --name "emacsserver"))
}

restart_daemon() {
  kill_daemon
  start_daemon
}

case $1 in
  -s)
    start_daemon
    ;;
  -k)
    kill_daemon
    ;;
  -r)
    restart_daemon
    ;;
  *)
    echo "Invalid command-line argument: $1"
    echo "Usage: btremacsd-nix -s | -k | -r"
    exit 1
    ;;
esac
EOF
    chmod +x "$out/bin/btremacsd-nix"
  '';

  meta = with lib; {
    description = "Simple script to run a headless Emacs server via Xvfb";
    license = licenses.mit;
    maintainers = [];
    platforms = platforms.unix;
  };
}
