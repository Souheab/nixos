# TODO: This package is not complete, it is a WIP, do not use this
# You need to make the FHS work with the nordvpnd binary
{ autoPatchelfHook, buildFHSEnv, dpkg
, fetchurl, lib, stdenv, sysctl, iptables, iproute2, procps, cacert, libxml2
, libidn2, zlib, wireguard-tools }:

let
  pname = "nordvpn";
  version = "3.16.2";

  nordVPNBase = stdenv.mkDerivation {
    inherit pname version;

    src = fetchurl {
      url =
        "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${version}_amd64.deb";
      hash = "sha256-6aAslJ2xwj+khF6HOMtkF0iclrUzhBV64xrHgs5Nc2s=";
    };

    buildInputs = [ libxml2 libidn2 ];
    nativeBuildInputs = [ dpkg autoPatchelfHook stdenv.cc.cc.lib ];

    dontConfigure = true;
    dontBuild = true;

    unpackPhase = ''
      runHook preUnpack
      dpkg --extract $src .
      runHook postUnpack
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      mv usr/* $out/
      mv var/ $out/
      mv etc/ $out/
      runHook postInstall
    '';
  };

  nordVPNfhs = buildFHSEnv {
    name = "nordvpnd";

    # hardcoded path to /sbin/ip
    targetPkgs = pkgs:
      with pkgs; [
        nordVPNBase
        sysctl
        iptables
        iproute2
        procps
        cacert
        libxml2
        libidn2
        zlib
        wireguard-tools
      ];

    runScript = ''
      # Set up /var
      mkdir -m 700 -p /var/lib/nordvpn
      if [ -z "$(ls -A /var/lib/nordvpn)" ]
      then
      cp -r $out/var/lib/nordvpn/* /var/lib/nordvpn
      echo created
      fi
      ls -la /var/lib/nordvpn
      echo hej > /var/lib/nordvpn/data/countries.dat
    '';

  # runScript = ''
  #   echo "Testing file system in buildFHSEnv"
    
  #   # Try to write to /tmp
  #   echo "Hello" > /tmp/test_file
  #   cat /tmp/test_file
    
  #   # Try to write to /var
  #   mkdir -p /var/test
  #   echo "Var test" > /var/test/var_file
  #   cat /var/test/var_file
    
  #   # Try to write to /nix/store (should fail)
  #   if touch /nix/store/test_file 2>/dev/null; then
  #     echo "Warning: Was able to write to /nix/store"
  #   else
  #     echo "As expected, cannot write to /nix/store"
  #   fi
    
  #   echo "Test complete. Exit this environment to see changes disappear."
  #   exec bash
  # '';
  # };

in stdenv.mkDerivation {
  inherit pname version;

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin $out/share
    ln -s ${nordVPNBase}/bin/nordvpn $out/bin
    ln -s ${nordVPNfhs}/bin/nordvpnd $out/bin
    ln -s ${nordVPNBase}/share* $out/share
    ln -s ${nordVPNBase}/var $out/
    runHook postInstall
  '';

  meta = with lib; {
    description = "CLI client for NordVPN";
    homepage = "https://www.nordvpn.com";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
}
  
