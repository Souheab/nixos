{
  description = "Desktop nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
  in
  {
    nixosConfigurations.lancestrom = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix  # Your existing NixOS config file
      ];
      specialArgs = { inherit pkgs; };
    };
  };
}
