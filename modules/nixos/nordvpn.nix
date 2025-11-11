{ pkgs,  ... }:
let
  nordvpn = pkgs.nur.repos.wingej0.nordvpn;
in
{
  environment.systemPackages = [ nordvpn ];

  networking.firewall = {
    checkReversePath = false;
    allowedTCPPorts = [ 443 ];
    allowedUDPPorts = [ 1194 ];
  };

  users.groups.nordvpn = { };
  users.users.suller.extraGroups = [ "nordvpn" ];

  systemd = {
    services.nordvpn = {
      description = "NordVPN daemon.";
      serviceConfig = {
        ExecStart = "${nordvpn}/bin/nordvpnd";
        # TODO this is not completely reproducable
        # If the user already has /var/liba
        # Impermananece should fix it but look for a solution
        # that fixes it directly at it's core.
        # Maybe making the nordvpnd binary in a chroot
        # Or patching the right paths if possible
        ExecStartPre = ''
          ${pkgs.bash}/bin/bash -c '\
          mkdir -m 700 -p /var/lib/nordvpn; \
          if [ -z "$(ls -A /var/lib/nordvpn)" ]; then \
          cp -r ${nordvpn}/var/lib/nordvpn/* /var/lib/nordvpn; \
          fi'
        '';
        NonBlocking = true;
        KillMode = "process";
        Restart = "on-failure";
        RestartSec = 5;
        RuntimeDirectory = "nordvpn";
        RuntimeDirectoryMode = "0750";
        Group = "nordvpn";
      };
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
    };
  };
}