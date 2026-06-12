{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    lazyvim.url = "github:pfassina/lazyvim-nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, lazyvim, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.home-manager
        {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           home-manager.backupFileExtension = "backup";
	   home-manager.extraSpecialArgs = { inherit lazyvim; };
           home-manager.users.ph = import ./home.nix;
        }
      ];
    };
  };
}
