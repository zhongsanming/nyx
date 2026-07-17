# Home-manager integration: imports the nixosModules.home-manager
# and configures it at the host level.
{ inputs }:
{
  den.aspects.home-manager = {
    nixos = {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager = {
        verbose = true;
        useUserPackages = true;
        useGlobalPkgs = true;
      };
    };
  };
}
