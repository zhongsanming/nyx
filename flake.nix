{
  description = "NixOS configuration with den framework.";

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } [
    (inputs.den.flakeModules.default or inputs.den.flakeModule)
    ./modules
  ];

  inputs = {
    den.url = "github:denful/den";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    vaultix = {
      url = "github:milieuim/vaultix";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };
}
