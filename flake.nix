{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    #home-manager = {
    #  url = "github:nix-community/home-manager";
    #  input.nixpkgs.follows = "nixpkgs";
    #}; 
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        extraSpecialArgs = {inherit inputs;};
        modules = [
          /etx/nixos/configuration.nix
          #inputs.home-manager.nixosModules.default
        ];
      };
  };
}
