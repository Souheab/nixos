{
  description = "Desktop nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    nixvim.url = "github:Souheab/nixvim";
  };

  outputs = { self, nixpkgs, home-manager, nur, nixvim, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
    mypkgs = import ./packages { inherit pkgs; inherit (pkgs) lib; };
    nur-modules = import nur {
      nurpkgs = nixpkgs.legacyPackages.${system};
      pkgs = nixpkgs.legacyPackages.${system};
    };
  in
  {
    nixosConfigurations.lancestrom = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit mypkgs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit system; inherit mypkgs; inherit nixvim; };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.suller = import ./home.nix;
        }
        nur.modules.nixos.default
      ];
    };
  };
}
